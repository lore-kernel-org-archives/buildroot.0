From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 15 Jul 2017 00:04:47 -0300
Subject: [Buildroot] [PATCH] support/testing: fix TestExt4 after ext2fs
 refactoring
References: <20170710214531.15758-1-arnout@mind.be>
Message-ID: <5969864f1120e_a571321b20566b5@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jul 10, 2017 at 06:45 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> Commit bee9e881a2d3addd6880b39f3e33a7180d0b1eb4 removed the
> BR2_TARGET_ROOTFS_EXT2_BLOCKS but didn't update TestExt4 that uses
> (tests) that option.
> 
> Convert it to BR2_TARGET_ROOTFS_EXT2_SIZE, using 16M so the M gets
> tested as well.

http://patchwork.ozlabs.org/patch/788595/
that does not use the M, was applied instead.
Both generate a rootfs with size 16777216 bytes.

Regards,
Ricardo
