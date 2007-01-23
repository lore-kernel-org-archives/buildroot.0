From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 23 Jan 2007 23:40:15 +0100
Subject: [Buildroot] [PATCH] New options for JFFS2 to support Dataflash
Message-ID: <1169592015.5361.10.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AT45 SPI Dataflash need special options for mkfs.jffs2,
due to their nonstandard page size (528/1056 byte pages)

This allows these options to be configured.

Best Regards
Ulf Samuelsson






-------------- next part --------------
A non-text attachment was scrubbed...
Name: target_jffs2_Config.in_jffs2root.mk.patch
Type: text/x-patch
Size: 2675 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070123/09541322/attachment.bin 
