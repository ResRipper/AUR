#!/bin/bash
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

CHROOT=${CHROOT:-~/Projects/chroot}

cd "$1" || exit

# Update environment
arch-nspawn "$CHROOT"/root pacman -Syu || exit

if [ -f ./aur_deps ]; then
    # Find dependencies specified in file `aur_deps`,
    # download them from the AUR, build and install to chroot
    # Note: Yay required for auto-dependency resolve
    
    mapfile -t dep_list < ./aur_deps
    mkdir -p aur_cache && cd aur_cache || exit
    
    # Download
    yay -aG "${dep_list[@]}" || exit
    
    # Build
    yay -B --norebuild --noconfirm "${dep_list[@]}" || exit
    
    # Create package list for install
    cd ..
    install_list=()
    for dep in "${dep_list[@]}"
    do
        install_list+=(-I ./aur_cache/"${dep}"/*.tar.zst)
    done

    # Build
    makechrootpkg -c -r "$CHROOT" "${install_list[@]}" || exit
else
    # Build
    makechrootpkg -c -r "$CHROOT"
fi