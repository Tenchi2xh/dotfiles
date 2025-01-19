#!/usr/bin/env python3

import time
import os
import sys
from pathlib import Path


home = Path.home()
customizations = Path(home / ".local" / "customizations")

with open(Path(customizations / "animation"), "r") as f:
    lines = f.readlines()

# Hide cursor
sys.stdout.write("\033[?25l")
sys.stdout.flush()

left = "     \033[38;5;15m\033[48;5;33m   "
right = "   \033[0m\n"
spaces = "             "

try:
    for i in range(0, len(lines), 10):
        frame = ""
        # Move cursor to top left
        frame += "\033[H"
        frame += "\n\n" + left + spaces + right
        for j in range(i, i+10):
            frame += left + lines[j][:-1] + right
        frame += left + spaces + right
        sys.stdout.write(frame)
        sys.stdout.flush()
        time.sleep(0.01)
finally:
    # Show cursor
    sys.stdout.write("\033[?25h\n")
    sys.stdout.flush()
