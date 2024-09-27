#!/bin/bash

echo "Setting up to replace server values"

echo "Replacing SQL_ADDRESS..."
RUN sed -i "s/SERVER_PUBLIC_IP/${SERVER_PUBLIC_IP}/g" **/*.xml
rg SQL_ADDRESS -g '**/*.xml'-g '**/*.xml' -r "$0"
echo "Replacing SQL_ACCOUNT..."
rg SQL_ACCOUNT -g '**/*.xml' -r "$1"
echo "Replacing SQL_PASSWORD..."
rg SQL_PASSWORD -g '**/*.xml' -r "$2"
echo "Replacing SERVER_PRIVATE_IP..."
rg SERVER_PRIVATE_IP -g '**/*.xml' -r "$3"
echo "Replacing SERVER_PUBLIC_IP..."
rg SERVER_PUBLIC_IP -g '**/*.xml' -r "$4"
echo "Replacing SERVER_NAME..."
rg SERVER_NAME -g '**/*.xml' -r "$5"
echo "Done!"
