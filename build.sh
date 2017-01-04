#!/bin/sh -e

echo "- If this fails, you may need to install some crap."
echo "apt install subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc"
echo

ImageBuilder=OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64

if [ -f $ImageBuilder/Makefile ]; then
    echo "- You appear to already have the ImageBuilder directory, using that."
else
    curl https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64.tar.bz2 | tar xjf -
fi

make \
    -C $ImageBuilder \
    image \
    PROFILE="TLMR3040" \
    PACKAGES="kmod-fs-ext4 kmod-usb-storage block-mount"

cp $ImageBuilder/bin/ar71xx/*v2*factory.bin openwrt.bin

echo
echo "- All done. Install this firmware:"
ls -sh openwrt.bin
