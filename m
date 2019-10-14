From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:58:17 +0200
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version 3286c57
In-Reply-To: <1571083888-12690-1-git-send-email-pjtexier@koncepto.io>
References: <1571083888-12690-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191014225817.64023f29@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 22:11:28 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Also
>  - add hash for license file
>  - remove patches (already in version):
> 	- 0001-fw_printenv-remove-declaration-in-for-loop.patch
> 	- 0003-uboot_env-fix-build-with-musl-libc.patch
> 	- 0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
> 	- 0005-uboot_env-remove-pthread.h-header-file.patch
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  ...w_printenv-remove-declaration-in-for-loop.patch | 53 ----------------------
>  ...ts.txt-do-not-force-the-build-of-a-share.patch} |  0
>  .../0003-uboot_env-fix-build-with-musl-libc.patch  | 31 -------------
>  ...nv-fix-compilation-for-glibc-version-2.28.patch | 40 ----------------
>  ...05-uboot_env-remove-pthread.h-header-file.patch | 29 ------------
>  package/libubootenv/libubootenv.hash               |  3 +-
>  package/libubootenv/libubootenv.mk                 |  3 +-
>  7 files changed, 4 insertions(+), 155 deletions(-)
>  delete mode 100644 package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
>  rename package/libubootenv/{0002-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch => 0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch} (100%)
>  delete mode 100644 package/libubootenv/0003-uboot_env-fix-build-with-musl-libc.patch
>  delete mode 100644 package/libubootenv/0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
>  delete mode 100644 package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
