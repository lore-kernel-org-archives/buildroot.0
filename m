From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jul 2014 20:05:47 +0200
Subject: [Buildroot] [PATCHv2] e2fsprogs: bump to version 1.42.11
In-Reply-To: <1405096592-15847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405096592-15847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140711200547.7bcb014d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 11 Jul 2014 13:36:32 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ..._CFLAGS-add-includes-when-cross-compiling.patch | 29 ------------------
>  ...2fsck-fix-Makefile-dependency-for-quota.o.patch | 32 --------------------
>  ...n-fix-external-libblkid-test-for-static-l.patch | 34 ----------------------
>  package/e2fsprogs/e2fsprogs.mk                     |  4 +--
>  4 files changed, 1 insertion(+), 98 deletions(-)
>  delete mode 100644 package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch
>  delete mode 100644 package/e2fsprogs/e2fsprogs-0003-e2fsck-fix-Makefile-dependency-for-quota.o.patch
>  delete mode 100644 package/e2fsprogs/e2fsprogs-0004-configure.in-fix-external-libblkid-test-for-static-l.patch

Applied, thanks. Next time, could you include in the commit log a
description of why certain patches are kept and others are removed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
