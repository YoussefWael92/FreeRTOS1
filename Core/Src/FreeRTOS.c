/* All used FreeRTOS and HAL APIs are documented in the FreeRTOS_HAL_API_Documentation File in the main folder */
/* FreeRTOS native API */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "event_groups.h"
#include "semphr.h"

/* STM32 HAL and peripheral handles */
#include "main.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>

/* =========================================================
 * DATA TYPES
 * ========================================================= */

/* Identify which variable generated the message */
typedef enum
{
    SOURCE_COUNTER = 0,
    SOURCE_SHARED
} DataSource_t;

/* Each queue item contains its source and numerical value */
typedef struct
{
    DataSource_t source;
    uint32_t value;
} UARTMessage_t;


/* =========================================================
 * GLOBAL VARIABLES
 * ========================================================= */

/* Modified inside the external interrupt */
volatile uint32_t counter = 0;

/* Shared by IncreaseVar and DecreaseVar tasks */
uint32_t shared = 100;

extern UART_HandleTypeDef huart1;

/* =========================================================
 * FREERTOS OBJECT HANDLES
 * ========================================================= */

static QueueHandle_t UARTData;
static EventGroupHandle_t switchEventGroup;
static SemaphoreHandle_t sharedMutex;


/* Event bit set by the switch interrupt */
#define SWITCH_PRESSED_BIT    (1U << 0)


/* =========================================================
 * TASK FUNCTION DECLARATIONS
 * ========================================================= */

static void CalcSwitch1(void *argument);
static void IncreaseVar(void *argument);
static void DecreaseVar(void *argument);
static void UARTTask(void *argument);

void MX_FREERTOS_Init(void)
{
    /* Create a queue holding 16 messages.
       Each message is a UARTMessage_t structure. */
    UARTData = xQueueCreate(16, sizeof(UARTMessage_t));

    /* Create an event group for the switch interrupt. */
    switchEventGroup = xEventGroupCreate();

    /* Create a mutex to protect the shared variable. */
    sharedMutex = xSemaphoreCreateMutex();

    /* Check that all RTOS objects were created successfully. */
    configASSERT(UARTData != NULL);
    configASSERT(switchEventGroup != NULL);
    configASSERT(sharedMutex != NULL);

    /* All four tasks have the same priority. */

    BaseType_t result;

    result = xTaskCreate(
        CalcSwitch1,
        "CalcSwitch1",
        256,
        NULL,
        tskIDLE_PRIORITY + 1,
        NULL
    );
    configASSERT(result == pdPASS);

    result = xTaskCreate(
        IncreaseVar,
        "IncreaseVar",
        256,
        NULL,
        tskIDLE_PRIORITY + 1,
        NULL
    );
    configASSERT(result == pdPASS);

    result = xTaskCreate(
        DecreaseVar,
        "DecreaseVar",
        256,
        NULL,
        tskIDLE_PRIORITY + 1,
        NULL
    );
    configASSERT(result == pdPASS);

    result = xTaskCreate(
        UARTTask,
        "UARTTask",
        256,
        NULL,
        tskIDLE_PRIORITY + 1,
        NULL
    );
    configASSERT(result == pdPASS);
}

/* =========================================================
 * TASK 1: CALCULATE SWITCH VALUE
 * ========================================================= */

static void CalcSwitch1(void *argument)
{
    (void)argument;

    UARTMessage_t message;

    for (;;)
    {
        /*
         * Wait up to 2 RTOS ticks for the switch event.
         *
         * pdTRUE  = clear the event bit when received.
         * pdFALSE = any requested bit is sufficient.
         */
        EventBits_t bits = xEventGroupWaitBits(
            switchEventGroup,
            SWITCH_PRESSED_BIT,
            pdTRUE,
            pdFALSE,
            pdMS_TO_TICKS(2)
        );

        /* Continue only if the switch event occurred. */
        if ((bits & SWITCH_PRESSED_BIT) != 0)
        {
            /*
             * Take a snapshot of the counter.
             * The original counter is not modified.
             */
            uint32_t counterValue = counter;

            /* Multiply the snapshot by 10. */
            message.value = counterValue * 10U;
            message.source = SOURCE_COUNTER;

            /* Send the result to the UART queue. */
            (void)xQueueSend(UARTData, &message, portMAX_DELAY);
        }
    }
}

/* =========================================================
 * TASK 2: INCREMENT SHARED VARIABLE
 * ========================================================= */

static void IncreaseVar(void *argument)
{
    (void)argument;

    TickType_t lastWakeTime = xTaskGetTickCount();

    UARTMessage_t message;

    for (;;)
    {
        /* Run every 10 ticks = 10 ms at a 1 kHz tick rate. */
        vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(10));

        /* Protect the shared resource. */
        xSemaphoreTake(sharedMutex, portMAX_DELAY);

        shared++;

        /* If shared exceeds 200, reset it to 100. */
        if (shared > 200U)
        {
            shared = 100U;
        }

        /* Copy the value while the mutex is held. */
        message.value = shared;
        message.source = SOURCE_SHARED;

        xSemaphoreGive(sharedMutex);

        /* Queue operations occur after releasing the mutex. */
        (void)xQueueSend(UARTData, &message, portMAX_DELAY);
    }
}

/* =========================================================
 * TASK 3: DECREMENT SHARED VARIABLE
 * ========================================================= */

static void DecreaseVar(void *argument)
{
    (void)argument;

    TickType_t lastWakeTime = xTaskGetTickCount();

    UARTMessage_t message;

    for (;;)
    {
        /* Run every 12 ticks = 12 ms at a 1 kHz tick rate. */
        vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(12));

        /* Protect the shared resource. */
        xSemaphoreTake(sharedMutex, portMAX_DELAY);

        shared--;

        /* If shared falls below 100, reset it to 200. */
        if (shared < 100U)
        {
            shared = 200U;
        }

        /* Save the updated value before releasing the mutex. */
        message.value = shared;
        message.source = SOURCE_SHARED;

        xSemaphoreGive(sharedMutex);

        /* Send the snapshot without holding the mutex. */
        (void)xQueueSend(UARTData, &message, portMAX_DELAY);
    }
}

/* =========================================================
 * TASK 4: SEND QUEUED DATA TO THE PC
 * ========================================================= */

static void UARTTask(void *argument)
{
    (void)argument;

    UARTMessage_t receivedMessage;

    char txBuffer[64];

    for (;;)
    {
        /* Run once every 5 ticks = 5 ms. */
        vTaskDelay(pdMS_TO_TICKS(5));

        /*
         * Read one queued message without waiting.
         * If the queue is empty, continue to the next cycle.
         */
        if (xQueueReceive(UARTData, &receivedMessage, 0) == pdPASS)
        {
            int length;

            /* Prefix the value with its source. */
            if (receivedMessage.source == SOURCE_COUNTER)
            {
                length = snprintf(
                    txBuffer,
                    sizeof(txBuffer),
                    "Counter: %lu\r\n",
                    (unsigned long)receivedMessage.value
                );
            }
            else
            {
                length = snprintf(
                    txBuffer,
                    sizeof(txBuffer),
                    "Shared: %lu\r\n",
                    (unsigned long)receivedMessage.value
                );
            }

            /* Transmit the message using USART1. */
            if (length > 0 && length < (int)sizeof(txBuffer))
            {
                HAL_UART_Transmit(
                    &huart1,
                    (uint8_t *)txBuffer,
                    (uint16_t)length,
                    HAL_MAX_DELAY
                );
            }
        }
    }
}

/* =========================================================
 * EXTERNAL INTERRUPT CALLBACK: PA0
 * ========================================================= */

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == GPIO_PIN_0)
    {
        /* Increase the counter on each interrupt. */
        counter++;

        /* Reset it to zero as soon as it reaches 9. */
        if (counter >= 9U)
        {
            counter = 0U;
        }

        /*
         * Notify CalcSwitch1 from interrupt context.
         * Event-group setting is deferred to the FreeRTOS
         * timer service task.
         */
        if (switchEventGroup != NULL)
        {
            BaseType_t higherPriorityTaskWoken = pdFALSE;

            BaseType_t result = xEventGroupSetBitsFromISR(
                switchEventGroup,
                SWITCH_PRESSED_BIT,
                &higherPriorityTaskWoken
            );

            if (result == pdPASS)
            {
                portYIELD_FROM_ISR(higherPriorityTaskWoken);
            }
        }
    }
}

void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
    (void)xTask;
    (void)pcTaskName;

    taskDISABLE_INTERRUPTS();

    while (1)
    {
    }
}
