#!/bin/bash

echo "Setting up to replace server values"
SQL_ADDRESS=$0
SQL_ACCOUNT=$1
SQL_PASSWORD=$2
SERVER_PRIVATE_IP=$3
SERVER_PUBLIC_IP=$4
SERVER_NAME=$5

echo "Replacing SQL_ADDRESS..."
sed -i "s/SQL_ADDRESS/${SQL_ADDRESS}/g" **/*.xml
echo "Replacing SQL_ACCOUNT..."
sed -i "s/SQL_ACCOUNT/${SQL_ACCOUNT}/g" **/*.xml
echo "Replacing SQL_PASSWORD..."
sed -i "s/SQL_PASSWORD/${SQL_PASSWORD}/g" **/*.xml
echo "Replacing SERVER_PRIVATE_IP..."
sed -i "s/SERVER_PRIVATE_IP/${SERVER_PRIVATE_IP}/g" **/*.xml
echo "Replacing SERVER_PUBLIC_IP..."
sed -i "s/SERVER_PUBLIC_IP/${SERVER_PUBLIC_IP}/g" **/*.xml
echo "Replacing SERVER_NAME..."
sed -i "s/SERVER_NAME/${SERVER_NAME}/g" **/*.xml
echo "Done!"
