#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/xun
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Inherit virtual_ab_ota_product.
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/android_t_baseline.mk)
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Call the proprietary setup.
$(call inherit-product, vendor/xiaomi/xun/xun-vendor.mk)

# Enable updating of APEXes.
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Project ID Quota.
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 31

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_EXTRA_VNDK_VERSIONS := 32

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Dtb
PRODUCT_COPY_FILES += \
    $(KERNEL_PATH)/dtb:dtb.img

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-Xun

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# F2FS utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery

# Overlays
PRODUCT_PACKAGES += \
    ApertureResXun \
    FrameworksResCommon \
    FrameworksResXun \
    SettingsResCommon \
    SettingsResXun \
    SystemUIResCommon \
    SystemUIResXun \
    WifiResCommon \
    WifiResXun

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
#PRODUCT_BUILD_SUPER_PARTITION := true

# Parts
PRODUCT_PACKAGES += \
    XiaomiParts

# Properties
include $(DEVICE_PATH)/configs/properties/default.mk

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.3

# Rootdir
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \
    init.qcom.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Update engine
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client
