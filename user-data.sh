#!/bin/bash
echo "Hello, World" >> index.html 
nohup busybox httpd -f -p "${Server_port}" &