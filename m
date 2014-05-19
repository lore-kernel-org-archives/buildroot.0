From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 19 May 2014 18:31:27 +0100
Subject: [Buildroot] Sundry newcomer questions
Message-ID: <0ee801cf7388$2b26e6f0$8174b4d0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fantastic. I've now got a rootfs.tar, zImage and 2 flavours of u-boot.bin ,
the second being u-boot-sunxi-with-spl.bin. Not sure if these will actually
work :) but thanks to all who helped.

Target in question is an Olimex A13 board. I'm specifically using Buildroot
to try and automate as much of the build/deployment as possible so I can
concentrate on the harder bits. 

Questions arising (apologies if these are not specifically buildroot related
and/or ): 

1. Why the 2 .bin files. Is this a mis-configuration on my part? 
2. The 'Instant Buildroot' ebook describes the use of dd, parted and friends
to create an SD ready image. Is there any reason, philosophical or
practical, why this cannot be added as a final, optional, step to the
buildroot process?
3. Am I correct in assuming that the .bin files, along with zImage, end up
on the first FAT partition of the target media, with the untar'd contents of
rootfs on the ext3 formatted second partition?
4. The QEMU arm-versatile example specify a -drive file that has a .ext2
extension. Does this mean that the options for creating .ext2/.ext3
filesystems are QEMU specific?
5. Can the .extX images be copied directly to a formatted SD card for
example? I'm unclear on this as my trial rootfs.ext3 appears to be a symlink
to a .ext2 file?

Many thanks.
