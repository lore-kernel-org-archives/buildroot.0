From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 23:28:44 +0200
Subject: [Buildroot] [PATCH v8 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170705210012.10226-1-s.martin49@gmail.com>
References: <20170705210012.10226-1-s.martin49@gmail.com>
Message-ID: <20170705232844.3fc6a0d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 23:00:11 +0200, Samuel Martin wrote:

> changes v7->v8:
> - correctly wrap help text (Arnout)

Hum, Arnout said on your v7:

"""
 I know I wrote ||, but I meant &&. Now this is always true. I guess you didn't
test this?
"""

It seems like you missed this comment. (Yes Arnout should strip e-mails
he is replying to! :-))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
