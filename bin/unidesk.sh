#!/bin/sh

echo "Connecting To UniDesk Server..."
echo "You will be propmpted for your password"

xfreerdp /u:ib250 /size:80% /d:campus /cert-ignore /v:unidesk.campus.bath.ac.uk
