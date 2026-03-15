#!/bin/bash
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

# (Re)create chroot environment

CHROOT=${CHROOT:-~/Projects/chroot}

rm -rf "$CHROOT" && mkdir -p "$CHROOT" && mkarchroot "${CHROOT%/}"/root base-devel