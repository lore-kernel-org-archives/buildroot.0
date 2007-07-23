From: Giammarco Zacheo <g.zacheo@gmail.com>
Date: Mon, 23 Jul 2007 13:53:09 +0200
Subject: [Buildroot] daily snapshot build for nios2 not working
Message-ID: <b054e88e0707230453x74dda4d8se86da67ae97b5e17@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
   I downloaded several of the latest daily snapshots for buildroot.
When I select the nios2 platform in the configuration menu, the
"Kernel Header Options" selection in the in the "Toolchain Options"
menu disappears. After completing configuration, at the "make
menuconfig" command i get this output:

wget --passive-ftp  -P /home/giammarco/buildroot/dl
127.0.0.1/unspecified-kernel-headers
--13:45:14--  http://127.0.0.1/unspecified-kernel-headers
           => `/home/giammarco/buildroot/dl/unspecified-kernel-headers'
Connecting to 127.0.0.1:80... failed: Connection refused.
make: *** [/home/giammarco/buildroot/dl/unspecified-kernel-headers] Error 1

i saw in the kconfig that there are links provided for the kernel
souce for all platforms but nios2.

Can anybody please help? I need a working toolchain and if possible a
build of uClibc for nios2 in order to use it with uClinux.

Thanks

Giammarco
