#!/usr/bin/env python3

import os
 
#print("PID: " + str(os.getpid()))

with open("/dev/urandom", "rb") as f:
    data = b""
    i = 0
    while True:
        data += f.read(10_000_000)  # 10 MB
        i += 1
        print(f"{i*10}mb")