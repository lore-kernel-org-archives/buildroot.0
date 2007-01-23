From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 23 Jan 2007 23:34:48 +0100
Subject: [Buildroot] [PATCH] Select MTD before EXT2/CRAMFS/SQUASHFS are built
Message-ID: <1169591688.5361.7.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building a file sysrtem will fail if the mtd tools are not
available. THis patch ensure MTD is selected if
either of ext2/cramfs/squashfs are selected.

Best Regards
Ulf Samuelsson



-------------- next part --------------
A non-text attachment was scrubbed...
Name: target_cramfs_squashfs_ext2_Config.in.patch
Type: text/x-patch
Size: 1656 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070123/cc873888/attachment.bin 
