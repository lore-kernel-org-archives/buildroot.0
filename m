From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:06:12 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.16
In-Reply-To: <c92f59e6efd59c9f887a81c2007d7d2962d45064.1523421916.git.baruch@tkos.co.il>
References: <c92f59e6efd59c9f887a81c2007d7d2962d45064.1523421916.git.baruch@tkos.co.il>
Message-ID: <20180412230612.38fcabf0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 07:45:16 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add a patch for fixing static build.
> 
> Add license information about the newly introduced libbtrfsutil.
> 
> Disable the libbtrfsutil python binding. It does not cross compile
> nicely.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...stall-static-library-and-headers-in-insta.patch |  4 ++-
>  ...-convert-ext2-Remove-check-for-ext2_ext_a.patch | 38 ---------------------
>  .../0003-btrfs.static-needs-libbtrfsutil.patch     | 39 ++++++++++++++++++++++
>  package/btrfs-progs/btrfs-progs.hash               |  4 ++-
>  package/btrfs-progs/btrfs-progs.mk                 |  9 ++---
>  5 files changed, 50 insertions(+), 44 deletions(-)
>  delete mode 100644 package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch
>  create mode 100644 package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
