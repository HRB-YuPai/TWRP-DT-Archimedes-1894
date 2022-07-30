#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/Archimedes

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Assert
TARGET_OTA_ASSERT_DEVICE := Archimedes

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_KERNEL_TAGS_OFFSET := 0x07880000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/xiaomi/Archimedes
TARGET_KERNEL_CONFIG := Archimedes_defconfig

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# SHRP Configuration
SHRP_DEVICE_CODE := 小米小爱老师4G版_Archimedes
SHRP_MAINTAINER := 雪域孤狼_https://midrai.cn
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
SHRP_DARK := true
SHRP_PATH := device/xiaomi/$(SHRP_DEVICE_CODE)
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true
SHRP_NOTCH := true
SHRP_EDL_MODE := 0
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_REC := /dev/block/by-name/recovery
INC_IN_REC_MAGISK := true
SHRP_OFFICIAL := true
INC_IN_REC_ADDON_1 := true
INC_IN_REC_ADDON_2 := true
INC_IN_REC_ADDON_3 := false
INC_IN_REC_ADDON_4 := false

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
LZMA_RAMDISK_TARGETS := recovery
LZMA_COMPRESSION := -9

#SHRP EXTERNAL ADDONS
SHRP_EXTERNAL_ADDON_PATH := "device/xiaomi/Archimedes/addon/"
SHRP_EXTERNAL_ADDON_1_NAME := "SELinux Permissiver"
SHRP_EXTERNAL_ADDON_1_INFO := "Makes SELinux Permissive"
SHRP_EXTERNAL_ADDON_1_FILENAME := "permissiver.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := "SELinux Enforcer"
SHRP_EXTERNAL_ADDON_2_INFO := "Reverts Back to Enforcing SELinux"
SHRP_EXTERNAL_ADDON_2_FILENAME := "enforcer.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_3_NAME := "[MIUI] Disable Replace SHRP"
SHRP_EXTERNAL_ADDON_3_INFO := "Flash in MIUI To Stop MIUI Recovery From Replacing"
SHRP_EXTERNAL_ADDON_3_FILENAME := "disable-replace-shrp.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_4_NAME := "System RW Support"
SHRP_EXTERNAL_ADDON_4_INFO := "Make System to read and writeable"
SHRP_EXTERNAL_ADDON_4_FILENAME := "systemrw.zip"
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true
SHRP_EXTERNAL_ADDON_5_NAME := "F2FS Patcher"
SHRP_EXTERNAL_ADDON_5_INFO := "Patch Vendor For Mount F2fs"
SHRP_EXTERNAL_ADDON_5_FILENAME := "F2fs-patcher.zip"
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := "Now You Can use DATA and CACHE as f2fs"
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true
SHRP_EXTERNAL_ADDON_6_NAME := "Imei Backup"
SHRP_EXTERNAL_ADDON_6_INFO := "Takes Imei backup"
SHRP_EXTERNAL_ADDON_6_FILENAME := "Imei-Backup.zip"
SHRP_EXTERNAL_ADDON_6_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_6_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_6 := true
SHRP_EXTERNAL_ADDON_7_NAME := "[MIUI]safetynet-fixer "
SHRP_EXTERNAL_ADDON_7_INFO := "Fix your safetynet error"
SHRP_EXTERNAL_ADDON_7_FILENAME := "safetynet-fix.zip"
SHRP_EXTERNAL_ADDON_7_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_7_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_7 := true
SHRP_EXTERNAL_ADDON_8_NAME := "vbmetapatcher"
SHRP_EXTERNAL_ADDON_8_INFO := "Patch vbmeta for fixing bootloop"
SHRP_EXTERNAL_ADDON_8_FILENAME := "vbmetapatch.zip"
SHRP_EXTERNAL_ADDON_8_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_8_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_8 := true
SHRP_EXTERNAL_ADDON_9_NAME := "Aroma file manager"
SHRP_EXTERNAL_ADDON_9_INFO := "Flash for using it"
SHRP_EXTERNAL_ADDON_9_FILENAME := "aromafm-2.00b7.zip"
SHRP_EXTERNAL_ADDON_9_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_9_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_9 := true
SHRP_EXTERNAL_ADDON_10_NAME := "Product and vendor backuper"
SHRP_EXTERNAL_ADDON_10_INFO := "Creat product.img and vendor.img in internal storage"
SHRP_EXTERNAL_ADDON_10_FILENAME := "pv-backuper.zip"
SHRP_EXTERNAL_ADDON_10_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_10_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_10 := true
SHRP_EXTERNAL_ADDON_11_NAME := "System vendor and product resizer"
SHRP_EXTERNAL_ADDON_11_INFO := "Must flash _Product and vendor backuper_ first because you lose them and must be restore for booting your device. "
SHRP_EXTERNAL_ADDON_11_FILENAME := "spv-resizer.zip"
SHRP_EXTERNAL_ADDON_11_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_11_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_11 := true
SHRP_EXTERNAL_ADDON_12_NAME := "[A11] System and vendor resizer"
SHRP_EXTERNAL_ADDON_12_INFO := "Flash for resize may not work with a12 for a12 use above zips"
SHRP_EXTERNAL_ADDON_12_FILENAME := "sv_resizer.zip"
SHRP_EXTERNAL_ADDON_12_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_12_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_12 := true

