###################This Code Helps You in installing Vesta in your Linux System #############
########### Run chmod +x xcrysden_resolve.sh in the directory containing the script #######
########### Run sh xcrysden_resolve.sh ####################################################
########### Script Written by - Sajal Biswas, Assistant Prof. of Physics, KWC, Nadia, WB ####
########### For any query Email :- sajalphys@gmail.com ######################################
#!/bin/bash

# Disable Wayland by setting WaylandEnable to false in /etc/gdm3/custom.conf

# Define the path to the configuration file
CONFIG_FILE="/etc/gdm3/custom.conf"

# Backup the original configuration file
sudo cp $CONFIG_FILE ${CONFIG_FILE}.bak

# Uncomment the WaylandEnable line and set it to false
sudo sed -i '/^#WaylandEnable=false/s/^#//' $CONFIG_FILE

# Restart GDM3 to apply the changes
sudo systemctl restart gdm3

# Optional: Prompt the user to restart the system for changes to take effect
echo "Wayland has been disabled. It's recommended to restart your system."
read -p "Would you like to restart now? (y/n): " RESTART

if [ "$RESTART" = "y" ]; then
    sudo reboot
else
    echo "Please remember to restart your system later."
fi

# End of script
