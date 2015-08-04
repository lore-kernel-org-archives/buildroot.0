From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:27:45 +0200
Subject: [Buildroot] [PATCH] mtd: bump to version 1.5.2
In-Reply-To: <1438634492-31171-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438634492-31171-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150804112745.51e15f38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Aug 2015 17:41:32 -0300, Gustavo Zacarias wrote:
> Patches upstream so drop them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...01-Fix-rpmatch-call-under-uClibc-and-musl.patch | 78 ----------------------
>  .../0002-lib-libfec.c-fix-build-against-musl.patch | 29 --------
>  .../0003-serve_image-do-not-include-error.h.patch  | 30 ---------
>  .../0004-recv_image-do-not-include-error.h.patch   | 30 ---------
>  .../0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch   | 76 ---------------------
>  package/mtd/mtd.hash                               |  4 +-
>  package/mtd/mtd.mk                                 |  2 +-
>  7 files changed, 3 insertions(+), 246 deletions(-)
>  delete mode 100644 package/mtd/0001-Fix-rpmatch-call-under-uClibc-and-musl.patch
>  delete mode 100644 package/mtd/0002-lib-libfec.c-fix-build-against-musl.patch
>  delete mode 100644 package/mtd/0003-serve_image-do-not-include-error.h.patch
>  delete mode 100644 package/mtd/0004-recv_image-do-not-include-error.h.patch
>  delete mode 100644 package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
