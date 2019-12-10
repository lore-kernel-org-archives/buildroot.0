From: rscr <rafacrespiramon@gmail.com>
Date: Tue, 10 Dec 2019 01:54:32 -0600 (CST)
Subject: [Buildroot] Custom tarball and .config file
Message-ID: <1575964472511-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

I am trying to use my Custom Tarball and I would like to use the
bcmrpi_defconfig as a base config for creating my custom linux config file. 

Here are the paths I am using.

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file://home/tec/rcr/tools/src/linux-rpi-4.19.y.tar.gz"
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/tec/rcr/projects/cp4/rscr_br2_extree/configs/ibLinux_defconfig"

I can build an image with that BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION and
the bcmrpi_defconfig, but now I would like to use my own .config based on
bcmrpi
 
1) Is there any way of using "make linux-menuconfig" pointing to my
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION path instead of  the /dl/linux
sources?

2) Is there any way of doing something like "make bcmrpi_defconfig", "make
linux-menuconfig"...just as for  the buildroot defconfig file?

Kind Regards, 

Rafa






--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
