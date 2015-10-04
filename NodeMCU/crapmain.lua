--crapmain.lua
--This is the main module for the crap nodes

print ('in crapmain')
--Initialise UART 9600baud, 8 data bits, no parity, 1 stop bit)
--uart.setup(0,9600,8,0,1,0)
--uart.write(0,'UART Active\n')

SSID = "SSID"
PW = "PW"
IPADR = "192.168.1.93" --Requested static IP address for the ESP
IPROUTER = "192.168.1.254" -- IP address for the Wifi router
wifi.setmode(wifi.STATION)
wifi.sta.setip({ip=IPADR,netmask="255.255.255.0",gateway=IPROUTER})
wifi.sta.config(SSID,PW)

--uart.write(0,'WiFi Active\n')
if wifi.getmode() then
    print('Wifi Active\n')
    srv=net.createServer(net.TCP) 
    srv:listen(80,function(conn) 
    conn:on("receive",function(conn,payload) 
        print(payload) 
        conn:send("<h1> Hello, NodeMCU.</h1>")
        end) 
    end)
    print('Server Active\n')
else
    print('No Wifi\n')
end


