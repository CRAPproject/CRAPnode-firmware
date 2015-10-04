--crapmain.lua
--This is the main module for the crap nodes

function onConnection(conn)
    conn:on("receive",onStatusRequest)
end

function onStatusRequest(conn,payload)
    print (payload)
    conn:send('{status:ok}')
    conn:close()
    requestData(conn)
end

function requestData(conn)
    print ('Data Has been Requested\n')
    rCon=net.createConnection(net.TCP, false) 
    rCon:on("receive", onUpdateRequest)
    rCon:connect(6372,"192.168.1.179")
    rCon:send("GET /a.crap?nodeid=1234&type=update&pinnumber=1&pinstate=0 HTTP/1.1\r\nHost: www.nodemcu.com\r\n"
    .."Connection: keep-alive\r\nAccept: */*\r\n\r\n")
    --rCon:send("a.crap?nodeid=1234&type=update&pinnumber=1&pinstate=0")
    
end

function onUpdateRequest(conn, payload)
    print('Received Payload: \n')
    print(payload)
end


print ('in crapmain')
--Initialise UART 9600baud, 8 data bits, no parity, 1 stop bit)
--uart.setup(0,9600,8,0,1,0)
--uart.write(0,'UART Active\n')

SSID = "HACKSPACE"
PW = "Hack_A_Day"
IPADR = "192.168.1.93" --Requested static IP address for the ESP
IPROUTER = "192.168.1.254" -- IP address for the Wifi router
wifi.setmode(wifi.STATION)
wifi.sta.setip({ip=IPADR,netmask="255.255.255.0",gateway=IPROUTER})
wifi.sta.config(SSID,PW)

--uart.write(0,'WiFi Active\n')
if wifi.getmode() then
    print('Wifi Active\n')
    srv=net.createServer(net.TCP) 
    srv:listen(6170,onConnection)
    print('Server Active\n')
else
    print('No Wifi\n')
end



