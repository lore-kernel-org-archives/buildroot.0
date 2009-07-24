From: Lars Lockenvitz <l.lockenvitz@fpga-art.de>
Date: Fri, 24 Jul 2009 10:11:00 +0200
Subject: [Buildroot] Execute Makefile before genrate rootfs
Message-ID: <4A696C94.4070905@fpga-art.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm looking for a way to execute a Makefile or script after all packages 
are build and installed but befor buildroot is generating the rootfs filr.
The reason is that for different projects I maybe need the same 
platform, packages and so on, but different settings for example in 
inittab or other coniguration files.

I hope someone know how to do this?!

Regards
