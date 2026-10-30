################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.c \
../FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.c 

S_UPPER_SRCS += \
../FreeRTOS-Kernel/portable/GCC/ARM_CR82/portASM.S 

OBJS += \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.o \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.o \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/portASM.o 

S_UPPER_DEPS += \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/portASM.d 

C_DEPS += \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.d \
./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.o FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.su FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.cyclo: ../FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.c FreeRTOS-Kernel/portable/GCC/ARM_CR82/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3_MPU" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/include" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/MemMang" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.o: ../FreeRTOS-Kernel/portable/GCC/ARM_CR82/%.S FreeRTOS-Kernel/portable/GCC/ARM_CR82/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CR82

clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CR82:
	-$(RM) ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.d ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.o ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/mpu_wrappers_v2_asm.su ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.cyclo ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.d ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.o ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/port.su ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/portASM.d ./FreeRTOS-Kernel/portable/GCC/ARM_CR82/portASM.o

.PHONY: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-ARM_CR82

