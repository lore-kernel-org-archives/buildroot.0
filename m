From: David Bonnin <dboml@free.fr>
Date: Fri, 12 Oct 2012 07:18:24 +0200
Subject: [Buildroot] post-buil script in chrooted
Message-ID: <5077A820.7050202@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Few ask in finalise target:
1- to do root task, i can only use permission: target in each 
packages..........
CAN i use a "root script" in chrooted mode?
ROOTFS_POST_BUILD_SCRIPT is not executed chrooted in the target.

2-
why rootfs targets are generated 2 times?   (in my case: rootfs.tar and 
rootfs.ubifs)
Generate 1 time and then generate tar and UBIFS is quicker.....so why?



"Thanks for this nice buildroot tool."
David.
