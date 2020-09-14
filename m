From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:23:01 +0200
Subject: [Buildroot] [PATCH] package/f2fs-tools: bump version to 1.14.0
In-Reply-To: <20200914144604.867053-1-nolange79@gmail.com>
References: <20200914144604.867053-1-nolange79@gmail.com>
Message-ID: <20200914212301.250a597f@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 16:46:04 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Remove upstreamed patches.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...-Makefile.am-fix-build-without-blkid.patch |  30 ---
>  .../0002-fsck.f2fs-correct-return-value.patch | 195 ------------------
>  package/f2fs-tools/f2fs-tools.hash            |   2 +-
>  package/f2fs-tools/f2fs-tools.mk              |   2 +-
>  4 files changed, 2 insertions(+), 227 deletions(-)
>  delete mode 100644 package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
>  delete mode 100644 package/f2fs-tools/0002-fsck.f2fs-correct-return-value.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
