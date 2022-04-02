#!/usr/bin/python
# apt install speedtest-cli
# https://pyshark.com/test-internet-speed-using-python/

import speedtest

s = speedtest.Speedtest()

#Bytes for conversion
bytes_num = 1000000

#Get download spead
dws = round(s.download()/bytes_num, 2)

#Get upload speed
ups = round(s.upload()/bytes_num, 2)

#Print internet speed
print(f'My download speed is: {dws} Mbps')
print(f'My upload speed is: {ups} Mbps')
