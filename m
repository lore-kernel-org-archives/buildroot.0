From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:22:44 +0200
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.28
In-Reply-To: <1460987988-1255-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460987988-1255-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160418212244.3e87ba7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 10:59:48 -0300, Gustavo Zacarias wrote:
> Drop upstream patches (0004-0008).
> Convert 0001-sscanf-no-ms-as.patch to git format.

Cool, any chance to submit this one upstream?

> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ... => 0001-Fix-libmount-build-under-uClibc.patch} | 48 +++++++++++--------
>  ...004-vipw-Remove-pre-ANSI-compiler-support.patch | 35 --------------
>  .../0005-build-sys-use-REALTIME_LIBS.patch         | 41 ----------------
>  ...sys-fix-static-configuration-and-building.patch | 54 ----------------------
>  package/util-linux/0007-build-sys-fix-typo.patch   | 34 --------------
>  ...don-t-free-shm-data-if-no-shm-id-is-found.patch | 42 -----------------
>  package/util-linux/util-linux.hash                 |  4 +-
>  package/util-linux/util-linux.mk                   |  7 ++-
>  8 files changed, 35 insertions(+), 230 deletions(-)
>  rename package/util-linux/{0001-sscanf-no-ms-as.patch => 0001-Fix-libmount-build-under-uClibc.patch} (66%)
>  delete mode 100644 package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch
>  delete mode 100644 package/util-linux/0005-build-sys-use-REALTIME_LIBS.patch
>  delete mode 100644 package/util-linux/0006-buildsys-fix-static-configuration-and-building.patch
>  delete mode 100644 package/util-linux/0007-build-sys-fix-typo.patch
>  delete mode 100644 package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
