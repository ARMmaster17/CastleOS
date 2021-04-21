//
// Created by wordm on 4/21/2021.
//

#ifndef CASTLEOS_ISR_H
#define CASTLEOS_ISR_H

#include "common.h"

typedef struct registers
{
    u32int ds;                  // Data segment selector
    u32int edi, esi, ebp, esp, ebx, edx, ecx, eax; // Pushed by pusha.
    u32int int_no, err_code;    // Interrupt number and error code (if applicable)
    u32int eip, cs, eflags, useresp, ss; // Pushed by the processor automatically.
} registers_t;

#endif //CASTLEOS_ISR_H
