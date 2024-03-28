#pymol installation script
#Sajal Biswas, Assistant Professor Physics, Krishnagar Women's College and Research Scholar, Department of Physics, University of Kalyani
#Follow the following instructions:- 
# 1) Go to the directory containing the script pymolinstall.sh
# In the terminal give the following command in the terminal to install-
# > chmod +x pymolinstall.sh
# > ./pymolinstall.sh
#For any feedback please contact sajalphys@gmail.com

#!/bin/bash

# Install PyMOL using package manager (if available)
echo "Trying to install PyMOL using package manager..."
sudo apt-get install -y pymol &> /dev/null || true

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo "PyMOL successfully installed using package manager."
  exit 0
fi

echo "Package manager installation failed. Trying manual download..."

# Download directory (change if needed)
download_dir="$HOME/Downloads"

# Create download directory if it doesn't exist
mkdir -p "$download_dir"

# Download URL (update for different versions)
download_url="https://pymol.org/installers/PyMOL-2.3.4_121-Linux-x86_64-py37.tar.bz2"

# Download PyMOL archive
wget -qO- "$download_url" | tar xjf - -C "$download_dir"

# Extract directory name (assuming consistent naming)
extract_dir=$(ls -d "$download_dir/PyMOL-*" 2>/dev/null | head -n 1)

# Check if download and extraction were successful
if [ -z "$extract_dir" ]; then
  echo "Download or extraction failed. Please check the download URL."
  exit 1
fi

# PyMOL executable path (replace with actual path if different)
pymol_path="$extract_dir/pymol"

# Create alias for PyMOL (change username and path if needed)
echo "Creating alias for PyMOL..."
echo "alias pymol='$pymol_path'" >> ~/.bashrc

# Source bashrc to update environment variables immediately
source ~/.bashrc

echo "PyMOL installation complete! Run 'pymol' to launch."
