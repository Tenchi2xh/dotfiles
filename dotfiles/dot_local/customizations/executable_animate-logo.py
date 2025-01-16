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

os.system("clear")
os.system(str(Path(customizations / "archey")))

start = "     \033[38;5;15m\033[48;5;33m   "
end = "   \033[0m\n"
spaces = "             "

try:
    for i in range(0, len(lines), 10):
        frame = ""
        # Move cursor to top left
        frame += "\033[0;0f"
        frame += "\n\n" + start + spaces + end
        for j in range(i, i+10):
            frame += start + lines[j][:-1] + end
        frame += start + spaces + end
        sys.stdout.write(frame)
        sys.stdout.flush()
        time.sleep(0.01)
finally:
    # Show cursor
    sys.stdout.write("\033[?25h\n")
    sys.stdout.flush()
