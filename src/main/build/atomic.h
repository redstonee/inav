/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <stdint.h>

#if defined(UNIT_TEST) || defined(SITL_BUILD)
static inline void __set_BASEPRI(uint32_t basePri) {(void)basePri;}
static inline void __set_BASEPRI_MAX(uint32_t basePri) {(void)basePri;}
#elif defined(__riscv)
#define __NVIC_PRIO_BITS 4
/*
 * RISC-V doesn't have an ARM-like BASEPRI priority mask.  Provide
 * simple enable/disable interrupt helpers using the MSTATUS MIE bit.
 *
 * We map the minimal BASEPRI API used by ATOMIC_BLOCK to:
 *  - __get_BASEPRI(): returns 0 if interrupts were enabled, 1 if disabled
 *  - __set_BASEPRI(val): if val!=0 disable interrupts, else enable
 *  - __set_BASEPRI_MAX(...): disable interrupts (ignore priority arg)
 */
#define __RISCV_MSTATUS_MIE (1UL << 3)
static inline uint8_t __get_BASEPRI(void)
{
    unsigned long mstatus;
    asm volatile("csrr %0, mstatus" : "=r" (mstatus) :: "memory");
    return (mstatus & __RISCV_MSTATUS_MIE) ? 0 : 1;
}
static inline void __set_BASEPRI(uint32_t basePri)
{
    if (basePri) {
        asm volatile("csrc mstatus, %0" :: "r"(__RISCV_MSTATUS_MIE) : "memory");
    } else {
        asm volatile("csrs mstatus, %0" :: "r"(__RISCV_MSTATUS_MIE) : "memory");
    }
}
static inline void __set_BASEPRI_MAX(uint32_t basePri)
{
    (void)basePri;
    asm volatile("csrc mstatus, %0" :: "r"(__RISCV_MSTATUS_MIE) : "memory");
}
#endif // UNIT_TEST / __riscv

// cleanup BASEPRI restore function, with global memory barrier
static inline void __basepriRestoreMem(uint8_t *val)
{
    __set_BASEPRI(*val);
}

// set BASEPRI_MAX function, with global memory barrier, returns true
static inline uint8_t __basepriSetMemRetVal(uint8_t prio)
{
    __set_BASEPRI_MAX(prio);
    return 1;
}

// The CMSIS provides the function __set_BASEPRI(priority) for changing the value of the BASEPRI register.
// The function uses the hardware convention for the ‘priority’ argument, which means that the priority must
// be shifted left by the number of unimplemented bits (8 – __NVIC_PRIO_BITS).
//
// NOTE: The priority numbering convention used in __set_BASEPRI(priority) is thus different than in the
// NVIC_SetPriority(priority) function, which expects the “priority” argument not shifted.

// Run block with elevated BASEPRI (using BASEPRI_MAX), restoring BASEPRI on exit. All exit paths are handled
// Full memory barrier is placed at start and exit of block
#ifdef UNIT_TEST
#define ATOMIC_BLOCK(prio) {}
#else
#define ATOMIC_BLOCK(prio) for ( uint8_t __basepri_save __attribute__((__cleanup__(__basepriRestoreMem))) = __get_BASEPRI(), \
                                     __ToDo = __basepriSetMemRetVal((prio) << (8U - __NVIC_PRIO_BITS)); __ToDo ; __ToDo = 0 )

#endif // UNIT_TEST
