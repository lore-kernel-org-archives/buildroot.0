From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:36:56 +0200
Subject: [Buildroot] [PATCH v10 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170709050039.8329-1-s.martin49@gmail.com>
References: <20170709050039.8329-1-s.martin49@gmail.com>
Message-ID: <20170709153656.2f91cd4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 07:00:38 +0200, Samuel Martin wrote:
> This change deprecates the ext2/3/4 rootfs size in blocks symbol in
> favor of one that mimic the fs-size argument behavior of mkfs (i.e.
> size in a human readable format accepting k, m, g or t suffix or their
> upper-case variants).
> 
> This change also updates the defconfigs that used to set
> BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> changes v9->v10:
> - fix typo (Arnout)
> - update legacy help text (Arnout)
> - remove useless comment (Arnout)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
