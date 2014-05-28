From: Rohit Kumar <rkthebest@gmail.com>
Date: Wed, 28 May 2014 16:09:02 +0900
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain for
	ARM1136
Message-ID: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

i created toolchain using buildroot for ARM1136
attached is the configuration file.
i want to cross compile the program with "-mfloat-abi=hard" option, i get
following error

/home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29:
fatal error: gnu/stubs-hard.h: No such file or directory
compilation terminated.

how to enable above in buildroot configuration?


With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140528/ed85a70d/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config
Type: application/octet-stream
Size: 47578 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140528/ed85a70d/attachment-0001.obj>
