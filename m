From: Siva Prakash Reddy Nareddy <subbu3881@gmail.com>
Date: Fri, 4 Nov 2016 18:03:38 +0530
Subject: [Buildroot] Support for MPC_8323E-RDB Board
Message-ID: <CANO2Q2-50CT2crNwtt8s7oyh_n+s0ukZ=zqT+R_8EtKh0+jg-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I am interested in using Buildroot to build Kernel and RootFs for the
development board "MPC8323E-RDB". I tried to use buildroot as specified in
Buildroot User Manual, but I am getting issues in building images for my
board. Please, Help us in building kernel and rootfs images for the board
"MPC8323E-RDB".

The issues I am getting are as follows..

jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig
configuration written to /home/buildroot-labs/buildroot/.config

*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
boot/uboot/uboot.mk:295: *** No board defconfig name specified, check your
BR2_TARGET_UBOOT_DEFCONFIG setting.  Stop.
jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
boot/uboot/uboot.mk:295: *** No board defconfig name specified, check your
BR2_TARGET_UBOOT_DEFCONFIG setting.  Stop.
jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig
configuration written to /home/buildroot-labs/buildroot/.config

*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
boot/uboot/uboot.mk:290: *** No U-Boot board name set. Check your
BR2_TARGET_UBOOT_BOARDNAME setting.  Stop.
jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
linux/linux.mk:441: *** No kernel device tree source specified, check your
BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS
settings.  Stop.

-- 
*SIVA*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161104/9e925c2f/attachment.html>
