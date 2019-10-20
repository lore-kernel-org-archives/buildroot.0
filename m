From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:39:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.177
In-Reply-To: <20191020101145.7417-1-bernd.kuhls@t-online.de>
References: <20191020101145.7417-1-bernd.kuhls@t-online.de>
Message-ID: <20191020153903.5322c2a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 12:11:45 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patched applied upstream, rebased remaining patches.
> Added md5 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...nable-disable-progs-configure-option.patch |  4 +-
>  ...e-Werror-conditional-to-BUILD_WERROR.patch |  4 +-
>  ...source-leak-in-elf-32-64-_updatefile.patch | 32 ----------
>  ...ix_memalign-instead-of-aligned_alloc.patch | 58 -------------------
>  package/elfutils/elfutils.hash                |  6 +-
>  package/elfutils/elfutils.mk                  |  2 +-
>  6 files changed, 11 insertions(+), 95 deletions(-)
>  delete mode 100644 package/elfutils/0003-libelf-Fix-possible-resource-leak-in-elf-32-64-_updatefile.patch
>  delete mode 100644 package/elfutils/0004-libelf-Use-posix_memalign-instead-of-aligned_alloc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
