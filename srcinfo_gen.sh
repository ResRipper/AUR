#!/bin/bash
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

cd "$1" || exit
makepkg --printsrcinfo > .SRCINFO