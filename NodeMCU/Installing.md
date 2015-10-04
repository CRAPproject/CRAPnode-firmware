#How to install code on the NodeMCU#

##Pre-requisites##

ESPlorer (Tested with v0.2.0)

##Uploading##

1. Open crapmain.lua and init.lua in ESPlorer
2. Open the serial port connected to the NodeMCU
3. Press the reset button in ESPlorer
4. With crapmain.lua open click on Save to ESP
5. Press the reset button in ESPlorer
6. With init.lua open, click Save to ESP
7. Press the reset button in ESPlorer

Code should now be running.

##Testing with simpleTCPServer.sh##

simpleTCPServer.sh has been writted to monitor the data
request sent from the CrapNode to the server and send
back dummy data as defined in response.json.

To Run on Linux
1. Ensure simpleTCPServer.sh is executable
2. run ./simpleTCPServer.sh from the command line.

To Run on Window
1. Download the latest Ubuntu Distribution
2. Install it
3. Follow "To Run on Linux" instructions
