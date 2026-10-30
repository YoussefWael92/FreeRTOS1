################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.c \
../FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.c \
../FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.c \
../FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.c 

OBJS += \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.o \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.o \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.o \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.o 

C_DEPS += \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.d \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.d \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.d \
./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/%.o FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/%.su FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/%.cyclo: ../FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/%.c FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3_MPU" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/include" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/MemMang" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CM55-2f-secure

clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CM55-2f-secure:
	-$(RM) ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.d ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.o ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context.su ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.d ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.o ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_context_port.su ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.d ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.o ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_heap.su ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.d ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.o ./FreeRTOS-Kernel/portable/GCC/ARM_CM55/secure/secure_init.su

.PHONY: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CM55-2f-secure

