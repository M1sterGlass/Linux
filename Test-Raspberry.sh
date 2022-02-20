#!/bin/bash

echo .
echo "CpuTemp"
vcgencmd measure_temp

echo .
echo "Current config"
vcgencmd get_config int | egrep "(arm|core|gpu|sdram)_freq|over_volt"

echo .
echo "Measure clock speeds"
for src in arm core h264 isp v3d; do echo -e "$src:\t$(vcgencmd measure_clock $src)"; done

echo .
echo "Measure volts"
for id in core sdram_c sdram_i sdram_p ; do echo -e "$id:\t$(vcgencmd measure_volts $id)"; done

echo .
echo "Throttled"
throttled="$(vcgencmd get_throttled)"
echo -e "$throttled"
if [[ $throttled != "throttled=0x0" ]]; then
    echo "WARNING:  You are being throttled.  This is likely because you are undervoltage.  Please connect your PI to a better power supply!"
fi

echo . 
echo "Test drive"
sudo curl https://raw.githubusercontent.com/TheRemote/PiBenchmarks/master/Storage.sh | sudo bash


