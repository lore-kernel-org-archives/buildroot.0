From: Guillaume William Bres-Saix <guillaume.bressaix@gmail.com>
Date: Thu, 26 Feb 2015 11:56:03 -0700
Subject: [Buildroot] zc706 (zynq) default config
Message-ID: <CAJe0E3dORoHuKtOi5x4-yhJRrrQKoCg6osFfMVAbnMT+gMOsRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is the file I use as a default config for the zc706 board (zynq SoC).
It's basically based on the zedboard_defconfig but looks for the right
devicetree. This builds a working uramdisk image and a rootfs.

You still have to follow buildroot/board/avnet/zedboard/readme.txt to
build uboot.


Guillaume William Bres-Saix
Software engineer - NIST
325 Broadway, Boulder, CO 80305
303-497-4939
<guillaume.bressaix@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150226/1fb2e599/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: zc706_defconfig
Type: application/octet-stream
Size: 1007 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150226/1fb2e599/attachment.obj>
