From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 19 Jun 2008 12:23:18 +0200
Subject: [Buildroot] GIT or SVN
Message-ID: <485A3396.80701@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm new to the uclibc buildroot. I've noticed that there are two repositories: GIT and SVN. GIT looks more up2date. Is GIT the tree to use?

Also, I'm trying to create a uclibc toolchain for cris architecture. Has anyone tried that? I'm trying with:
uclibc-0.9.29
gcc-4.3.0
binutils-2.18
linux-2.6.25.5

Here are two patches to make GIT tree compile binutils and uClibc.

Best regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc.patch
Type: text/x-patch
Size: 676 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080619/4b9a39c2/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: binutils.patch
Type: text/x-patch
Size: 1413 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080619/4b9a39c2/attachment-0001.bin 
