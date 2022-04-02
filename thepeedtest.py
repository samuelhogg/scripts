#!/usr/bin/python
# apt install speedtest-cli
# https://pyshark.com/test-internet-speed-using-python/

import speedtest

s = speedtest.Speedtest()
c = s.get_config()

bytes_num = 1000000

dws = round(s.download()/bytes_num, 2)

ups = round(s.upload()/bytes_num, 2)

print(f'My download speed is: {dws} Mbps')
print(f'My upload speed is: {ups} Mbps')
print('IP: ', c['client']['ip'])
print('Lat: ', c['client']['lat'])
print('Lon: ', c['client']['lon'])
print('ISP: ', c['client']['isp'])
