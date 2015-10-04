 --init.lua
 --init.lua is the script that NodeMCU will attempt to run automatically
 --when it powers on.
 --

function startup()
    print('in startup')
    dofile('crapmain.lua')
    end

tmr.alarm(0,10000,0,startup)