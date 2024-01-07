/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

static const variant_info_t xun_global_info = {
    .brand = "Redmi",
    .device = "xun",
    .marketname = "Redmi Pad SE",
    .model = "23073RPBFG",
    .mod_device = "xun_global",
    .build_fingerprint = "Redmi/xun_global/xun:13/TKQ1.221114.001/V14.0.4.0.TMUMIXM:user/release-keys",
};

void vendor_load_properties() {
    set_dalvik_heap();
    set_variant_props(xun_global_info);

    // SafetyNet workaround
    property_override("ro.boot.verifiedbootstate", "green");
}
