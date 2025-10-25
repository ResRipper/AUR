#!/usr/bin/python3
# Copyright 2025 resripper.
# SPDX-License-Identifier: Apache-2.0

# Push changes to AUR
#
# Prerequisites:
#   - Set a remote to AUR with the same name as the package:
#       git remote add -f <package name> <remote URL>

from subprocess import run
from argparse import ArgumentParser
from pathlib import Path

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("path", help="Package folder path", type=Path)
    args = parser.parse_args()

    # Check if target exist
    if not args.path.is_dir():
        raise FileNotFoundError(args.path)

    # Push
    run(["git", "subtree", "push", f"--prefix={str(args.path)}", args.path.name, "master"])
