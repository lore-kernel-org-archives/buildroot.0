From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:40:45 +0200
Subject: [Buildroot] [PATCH v5 1/5] fs/ext2: deprecate
 BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option
In-Reply-To: <20170704144729.19753-2-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-2-s.martin49@gmail.com>
Message-ID: <20170705004045.45007fa4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 16:47:25 +0200, Samuel Martin wrote:
> Soon, the ext{2,3,4} rootfs image will no longer be generated with
> genext2fs, but using mke2fs instead which has no support for the extra
> inode number option.
> 
> So, deprecate the BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option and
> recommend, in lieu, to set the total inode number, taking account of
> the extra ones if needed.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v4->v5:
> - reword legacy option help text (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
