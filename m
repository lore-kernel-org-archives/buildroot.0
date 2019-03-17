From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:30:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.12
In-Reply-To: <20190317153211.27782-1-fontaine.fabrice@gmail.com>
References: <20190317153211.27782-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317173024.2ccf5321@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 16:32:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-initialization-in-test-iodelay.patch  | 65 -----------------
>  .../jack2/0002-Improve-check-for-ucontext.patch    | 84 ----------------------
>  ...ace-support-depends-on-execinfo.h-existen.patch | 67 -----------------
>  .../0004-tests-define-__STDC_LIMIT_MACROS.patch    | 41 -----------
>  package/jack2/0005-gcc7.patch                      | 31 --------
>  package/jack2/0006-fix-ftbfs-with-clang.patch      | 28 --------
>  package/jack2/jack2.hash                           |  2 +-
>  package/jack2/jack2.mk                             |  2 +-
>  8 files changed, 2 insertions(+), 318 deletions(-)
>  delete mode 100644 package/jack2/0001-Fix-initialization-in-test-iodelay.patch
>  delete mode 100644 package/jack2/0002-Improve-check-for-ucontext.patch
>  delete mode 100644 package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch
>  delete mode 100644 package/jack2/0004-tests-define-__STDC_LIMIT_MACROS.patch
>  delete mode 100644 package/jack2/0005-gcc7.patch
>  delete mode 100644 package/jack2/0006-fix-ftbfs-with-clang.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
