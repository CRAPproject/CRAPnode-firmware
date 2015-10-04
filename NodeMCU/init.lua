 --init.lua
 --init.lua is the script that NodeMCU will attempt to run automatically
 --when it powers on.
 --

function startup()
    print('in startup')
    dofile('crapmain.lua')
    end

tmr.alarm(0,10000,0,startup)


 
 --wifi.sta.config("TNCAP488E39","D9E0A1BA8C")
 --wifi.sta.connect()
 --tmr.alarm(1, 5000, 1, function()
 -- if wifi.sta.getip()== nil then
 -- print("IP unavaiable, Waiting...")
 --else
 -- tmr.stop(1)
 --print("ESP8266 mode is: " .. wifi.getmode())
 --print("The module MAC address is: " .. wifi.ap.getmac())
 --print("Config done, IP is "..wifi.sta.getip())
 --dofile ("domoticz.lua")
 --end
 --end)
