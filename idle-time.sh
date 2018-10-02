#!/bin/sh

# Get MacOSX idletime. Shamelessly stolen from http://bit.ly/yVhc5H
/usr/sbin/ioreg -c IOHIDSystem | /usr/bin/awk '/HIDIdleTime/ {print int($NF/1000000000); exit}'
