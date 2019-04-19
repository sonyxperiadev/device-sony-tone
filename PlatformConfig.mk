# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/tone
PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8996
KERNEL_PATH := kernel/sony/msm-$(SOMC_KERNEL_VERSION)

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7464900.sdhci

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x075b0000 restore_msm_uart=0x01014000

TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.tone

# Wi-Fi definitions for Broadcom solution but using brcmfmac instead of bcmdhd kernel driver
BOARD_WLAN_DEVICE           := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_qcwcn

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_COMMON_PATH)/bluetooth/vnd_generic.txt

# RIL
TARGET_PER_MGR_ENABLED := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_SDE := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# Cache partition
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform witout a vendor partition
TARGET_COPY_OUT_VENDOR := system/vendor

include device/sony/common/CommonConfig.mk
