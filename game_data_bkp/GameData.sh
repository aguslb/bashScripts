#!/bin/bash
user="agusmac"
localDate=$(date +'%F_%H_%M')
exist=(0 0 0)
if [[ ! -d "/Users/$user/Bridge/saveGames" ]]
then
    mkdir -p /Users/agusmac/Bridge/saveGames/
fi
if [[ -d "/Users/$user/Library/Application Support/Car Mechanic Simulator 2018 Backup" ]]
then
echo "yup1"
    exist[0]=1
    cd "/Users/$user/Library/Application Support/Car Mechanic Simulator 2018 Backup"
    mkdir /Users/$user/Bridge/saveGames/CarSimBkp_$localDate/
    rsync -ra . /Users/$user/Bridge/saveGames/CarSimBkp_$localDate/
fi
if [[ -d "/Users/$user/Library/Application Support/minecraft/saves" ]]
then
echo "yup2"
    exist[1]=1
    cd "/Users/$user/Library/Application Support/minecraft/saves"
    mkdir /Users/$user/Bridge/saveGames/MineCraft_$localDate/
    rsync -ra . /Users/$user/Bridge/saveGames/MineCraft_$localDate/
fi
if [[ -d "/Users/$user/Library/Application Support/OpenEmu/Save States" ]]
then
echo "yup3"
    exist[2]=1
    cd "/Users/$user/Library/Application Support/OpenEmu/Save States"
    mkdir /Users/$user/Bridge/saveGames/OpenEmu_$localDate/
    rsync -ra . /Users/$user/Bridge/saveGames/OpenEmu_$localDate/
fi
if [[ " ${exist[@]} " =~ "1" ]]
then
    cd /Users/$user/Bridge
    tar -zcf saveGames_$localDate.tar.gz saveGames
    rm -rf /Users/$user/Bridge/saveGames
    echo "Backup for: $localDate Done!!!"
else
    echo "Nothing to backup on: $localDate better luck next time"
fi