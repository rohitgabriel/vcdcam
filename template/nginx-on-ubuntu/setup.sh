#!/bin/bash
if [ x$1 = x"precustomization" ]; then
echo "Started doing pre-customization steps..."
echo "Finished doing pre-customization steps."
elif [ x$1 = x"postcustomization" ]; then
echo "Started doing post-customization steps..."
apt-get update && apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
echo "Finished doing post-customization steps."
fi
