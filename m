From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 07:57:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/boost: bump version to 1.61.0
In-Reply-To: <1465046257-16270-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465046257-16270-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160608075709.18ba2d59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 15:17:36 +0200, Bernd Kuhls wrote:
> removed patches applied upstream, renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/boost/{0006-fenv.patch => 0003-fenv.patch} |  0
>  package/boost/0003-fix-libquadmath-issue.patch     | 91 ----------------------
>  .../0004-fix-declaration-error-with-gcc-4-4.patch  | 50 ------------
>  ...ix-getchar-with-uclibc-and-gcc-bug-58952.patch} |  0
>  package/boost/0005-fix-undeclared-isnan.patch      | 32 --------
>  package/boost/boost.hash                           |  6 +-
>  package/boost/boost.mk                             |  2 +-
>  7 files changed, 4 insertions(+), 177 deletions(-)
>  rename package/boost/{0006-fenv.patch => 0003-fenv.patch} (100%)
>  delete mode 100644 package/boost/0003-fix-libquadmath-issue.patch
>  delete mode 100644 package/boost/0004-fix-declaration-error-with-gcc-4-4.patch
>  rename package/boost/{0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch => 0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch} (100%)
>  delete mode 100644 package/boost/0005-fix-undeclared-isnan.patch

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
