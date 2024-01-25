#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Evolution stuff.
$(call inherit-product, vendor/evolution/config/common_full_tablet_wifionly.mk)
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_USES_PICO_GAPPS := true

# Inherit from xun device.
$(call inherit-product, device/xiaomi/xun/device.mk)

## Device identifier
PRODUCT_DEVICE := xun
PRODUCT_NAME := evolution_xun
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := xun

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="xun-user 13 TKQ1.221114.001 V816.0.3.0.UMUCNXM release-keys"

BUILD_FINGERPRINT := Redmi/xun/xun:13/TKQ1.221114.001/V816.0.3.0.UMUCNXM:user/release-keys
