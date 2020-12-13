opkg install kmod-usb-ohci kmod-usbip-server kmod-usbip-client
wget https://downloads.openwrt.org/releases/18.06.1/packages/mipsel_24kc/packages/usbip-client_2.0-10_mipsel_24kc.ipk 
wget https://downloads.openwrt.org/releases/18.06.1/packages/mipsel_24kc/packages/usbip-server_2.0-10_mipsel_24kc.ipk 
wget https://downloads.openwrt.org/releases/18.06.1/packages/mipsel_24kc/packages/usbip_2.0-10_mipsel_24kc.ipk
wget https://downloads.openwrt.org/releases/17.01.7/packages/mipsel_24kc/packages/libudev_3.2-1_mipsel_24kc.ipk

opkg install usbip_2.0-10_mipsel_24kc.ipk
opkg install usbip-server_2.0-10_mipsel_24kc.ipk
opkg install usbip-client_2.0-10_mipsel_24kc.ipk

opkg remove --force-depends libudev-fbsd
opkg install libudev_3.2-1_mipsel_24kc.ipk
