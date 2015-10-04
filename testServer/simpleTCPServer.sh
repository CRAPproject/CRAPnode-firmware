echo "Opening TCP Server"
while true; do netcat -l 6372 < response.json; done
