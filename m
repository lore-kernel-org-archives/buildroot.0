From: Robert B. Williams <rwilliams@valcom.com>
Date: Wed, 09 Jul 2008 09:30:30 -0400
Subject: [Buildroot] built without large file support
Message-ID: <4874BD76.5030207@valcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am trying to compile grub and it is complaining that large file support 
is turned off and that _FILE_OFFSET_BITS=64.  I guess one of these 
things needs to change....

 From menuconfig I tried to enable large file support in the toolchain 
area....no affect.

Please help...

2nd:
What do I need to do to boot linux with root filesystem in flash?

So far I created a cpio image and well that runs off of a ramdisk.
