#!/bin/bash
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

# Update packages in the chroot environment

CHROOT=${CHROOT:-~/Projects/chroot}

arch-nspawn "$CHROOT"/root pacman -Syu
