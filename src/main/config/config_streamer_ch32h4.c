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

#include <string.h>

#include "config/config_streamer.h"
#include "drivers/system.h"
#include "platform.h"

#if defined(CH32H4) && !defined(CONFIG_IN_RAM) && \
    !defined(CONFIG_IN_EXTERNAL_FLASH)

#define FLASH_BASE_ADDR       0x08000000U
#define FLASH_PAGE_SIZE ((uint32_t)8192)

void config_streamer_impl_unlock(void)
{
    FLASH_Unlock();
    FLASH_ClearFlag(FLASH_FLAG_EOP | FLASH_FLAG_WRPRTERR | FLASH_FLAG_OPTERR);
}

void config_streamer_impl_lock(void) { FLASH_Lock(); }

int config_streamer_impl_write_word(config_streamer_t* c,
                                    config_streamer_buffer_align_type_t* buffer)
{
    if (c->err != 0) {
        return c->err;
    }

    uint32_t addr= FLASH_BASE_ADDR + c->address;

    if (c->address % FLASH_PAGE_SIZE == 0) {
        const FLASH_Status status = FLASH_ErasePage(addr);
        if (status != FLASH_COMPLETE) {
            return -1;
        }
    }

    const FLASH_Status status = FLASH_ProgramWord(addr, *buffer);
    if (status != FLASH_COMPLETE) {
        return -2;
    }

    c->address += CONFIG_STREAMER_BUFFER_SIZE;
    return 0;
}

#endif
