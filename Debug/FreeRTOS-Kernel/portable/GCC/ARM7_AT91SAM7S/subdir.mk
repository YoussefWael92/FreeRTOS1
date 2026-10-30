################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.c \
../FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.c \
../FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.c 

OBJS += \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.o \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.o \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.o 

C_DEPS += \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.d \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.d \
./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/%.o FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/%.su FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/%.cyclo: ../FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/%.c FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3_MPU" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/include" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/MemMang" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S

clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S:
	-$(RM) ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.d ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.o ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/lib_AT91SAM7X256.su ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.d ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.o ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/port.su ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.d ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.o ./FreeRTOS-Kernel/portable/GCC/ARM7_AT91SAM7S/portISR.su

.PHONY: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM7_AT91SAM7S

