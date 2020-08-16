From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 22:13:39 +0200
Subject: [Buildroot] [PATCH] package/xen: bump version to 4.14.0
In-Reply-To: <20200816025307.395-1-alistair@alistair23.me>
References: <20200816025307.395-1-alistair@alistair23.me>
Message-ID: <20200816221339.26be05af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 19:53:07 -0700
Alistair Francis <alistair@alistair23.me> wrote:

> Bump the Xen package to the latest release. We can also remove a patch
> to change the CFLAGS as it is no longer required.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  ...e-linux-limits.h-for-XATTR_SIZE_MAX.patch} |  0
>  ...x-build-with-CFLAGS-from-environment.patch | 36 -------------------
>  package/xen/xen.hash                          |  2 +-
>  package/xen/xen.mk                            |  2 +-
>  4 files changed, 2 insertions(+), 38 deletions(-)
>  rename package/xen/{0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch => 0001-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch} (100%)
>  delete mode 100644 package/xen/0001-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch

You had forgotten to update the hash of the license file, which had
changed. I've done that, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
