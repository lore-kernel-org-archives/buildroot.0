From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:23:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump version to 2.36
In-Reply-To: <20200922144731.2546-1-mf@go-sys.de>
References: <20200922144731.2546-1-mf@go-sys.de>
Message-ID: <20200922212308.77441ccb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Sep 2020 16:47:31 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Drop patches 0001-0004: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...0001-blkdiscard-use-O_EXCL-add-force.patch |  86 --------
>  ...d-fdisk_set_disklabel_id_from_string.patch | 195 ------------------
>  ...k-add-disk-id-to-change-disk-UUID-ID.patch | 139 -------------
>  .../0004-include-cleanup-pidfd-inckudes.patch |  40 ----
>  package/util-linux/util-linux.hash            |   4 +-
>  package/util-linux/util-linux.mk              |   5 +-
>  6 files changed, 4 insertions(+), 465 deletions(-)
>  delete mode 100644 package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
>  delete mode 100644 package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
>  delete mode 100644 package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
>  delete mode 100644 package/util-linux/0004-include-cleanup-pidfd-inckudes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
