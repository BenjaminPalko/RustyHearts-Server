#!/bin/bash

echo "Installing Windows dependencies..."
winetricks --unattended dotnet7 dotnetdesktop7 vcrun2010 d3dx9 d3dx10
