################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS-Kernel/portable/GCC/RISC-V/port.c 

S_UPPER_SRCS += \
../FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S 

OBJS += \
./FreeRTOS-Kernel/portable/GCC/RISC-V/port.o \
./FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.o 

S_UPPER_DEPS += \
./FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.d 

C_DEPS += \
./FreeRTOS-Kernel/portable/GCC/RISC-V/port.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS-Kernel/portable/GCC/RISC-V/%.o FreeRTOS-Kernel/portable/GCC/RISC-V/%.su FreeRTOS-Kernel/portable/GCC/RISC-V/%.cyclo: ../FreeRTOS-Kernel/portable/GCC/RISC-V/%.c FreeRTOS-Kernel/portable/GCC/RISC-V/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3_MPU" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/include" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/GCC/ARM_CM3" -I"C:/Users/Wael/STM32CubeIDE/workspace_1.19.0/rtos/FreeRTOS-Kernel/portable/MemMang" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
FreeRTOS-Kernel/portable/GCC/RISC-V/%.o: ../FreeRTOS-Kernel/portable/GCC/RISC-V/%.S FreeRTOS-Kernel/portable/GCC/RISC-V/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m3 -g -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-RISC-2d-V

clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-RISC-2d-V:
	-$(RM) ./FreeRTOS-Kernel/portable/GCC/RISC-V/port.cyclo ./FreeRTOS-Kernel/portable/GCC/RISC-V/port.d ./FreeRTOS-Kernel/portable/GCC/RISC-V/port.o ./FreeRTOS-Kernel/portable/GCC/RISC-V/port.su ./FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.d ./FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.o

.PHONY: clean-FreeRTOS-2d-Kernel-2f-portable-2f-GCC-2f-RISC-2d-V

