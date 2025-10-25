#!/bin/bash
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

pactree -rsud1 "$1" | grep base-devel
pactree -rsud1 "$1" | grep base
pactree -rsud1 "$1" | grep util-linux