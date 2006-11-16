From: Gilad Rom <gilad.rom@gmail.com>
Date: Thu, 16 Nov 2006 12:51:39 +0200
Subject: [Buildroot] [PATCH] Various package additions and updates
Message-ID: <39d7ed000611160251v1c5e8e1fn7620bdcaa4394286@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List,

For my first post, I'd like to attach a patch which updates the following:

1. Add alsa-lib, alsa-utils, iperf and samba.
2. Fix and update dialog to version 20060221
3. Fix and update directfb to version 1.0.0-rc2
4. Update mpg123 to version 0.61, and add support for OSS/ALSA.
5. Update strace to 4.5.14, and add a patch to fix ARM EABI.

And now for the questions: Has anyone successfully built
buildroot using uClibc-nptl from scratch? It seems to be
that NPTL support on uClibc requires an existing cross
toolchain in order to compile(?)

Thanks,

Gilad Rom
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061116/5d138ea3/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-megapatch.patch
Type: text/x-patch
Size: 23974 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061116/5d138ea3/attachment-0001.bin 
