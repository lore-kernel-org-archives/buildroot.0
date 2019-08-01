From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 15:44:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/bison: bump version to 3.4.1
In-Reply-To: <20190630080904.4105-1-bernd.kuhls@t-online.de>
References: <20190630080904.4105-1-bernd.kuhls@t-online.de>
Message-ID: <20190801154455.48a520bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Jun 2019 10:09:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00014.html
> 
> Removed patches applied to upstream gnulib:
> http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
> http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=74d9d6a293d7462dea8f83e7fc5ac792e956a0ad
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...adjust-to-glibc-2.28-libio.h-removal.patch | 50 -------------------
>  ...e-more-paranoid-about-libio.h-change.patch | 46 -----------------
>  package/bison/bison.hash                      |  2 +-
>  package/bison/bison.mk                        |  2 +-
>  4 files changed, 2 insertions(+), 98 deletions(-)
>  delete mode 100644 package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>  delete mode 100644 package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
