/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#if !defined(OS_GENERIC)
#include <cutils/properties.h>
#include <string.h>

static inline const char* getBTDefaultName()
{
    char device[PROPERTY_VALUE_MAX];
    property_get("ro.boot.hardware", device, "");

    if (!strcmp("dora", device)) {
        return "Xperia X Performance";
    }

    if (!strcmp("kagura", device)) {
        return "Xperia XZ";
    }

    if (!strcmp("keyaki", device)) {
        return "Xperia XZs";
    }

    return "Xperia";
}

#define BTM_DEF_LOCAL_NAME getBTDefaultName()
#endif // OS_GENERIC

#define BLUETOOTH_QTI_SW TRUE

// Wide-band speech support
#define BTM_WBS_INCLUDED TRUE
#define BTIF_HF_WBS_PREFERRED TRUE

// Disables read remote device feature
#define BTA_SKIP_BLE_READ_REMOTE_FEAT FALSE
// TODO: zuk has 7 here
#define MAX_ACL_CONNECTIONS   16
// TODO: zuk has 16 here
// TODO: beryllium has 20 here
#define MAX_L2CAP_CHANNELS    16
// Google VSC spec support
#define BLE_VND_INCLUDED   TRUE
// Skips conn update at conn completion
#define BTA_BLE_SKIP_CONN_UPD  FALSE
#define BLE_PERIPHERAL_ADV_NAME FALSE
// QCOM power management workaround
#define BT_CLEAN_TURN_ON_DISABLED 1

// Increasing SEPs to 12 from 6 to support SHO/MCast, i.e. two streams per codec
#define AVDT_NUM_SEPS 12

#undef PROPERTY_VALUE_MAX

#endif
