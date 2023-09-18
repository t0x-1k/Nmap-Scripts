#!/bin/bash

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap is not installed. Please install it and try again."
    exit 1
fi

# Parse the command-line arguments using getopts
while getopts ":i:" opt; do
  case $opt in
    i)
      ip="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Check if IP address (or range) is provided
if [ -z "$ip" ]; then
    echo "Please specify an IP address or range using the -a flag."
    exit 1
fi

# Run nmap on the specified IP
nmap -T1 -sN -Pn $ip

# "Sneaky" Timing Template (possible IDS evasion)
# Disabled Ping scan with TCP bit set to 0

exit 0
