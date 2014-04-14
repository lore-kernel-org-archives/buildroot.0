From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:48:56 +0200
Subject: [Buildroot] [PATCH] gd: bump to version 2.1.0
In-Reply-To: <d197f80e0b502ee097a9b45b3f1b285d73f7832e.1397369576.git.baruch@tkos.co.il>
References: <d197f80e0b502ee097a9b45b3f1b285d73f7832e.1397369576.git.baruch@tkos.co.il>
Message-ID: <20140414224856.76cd209a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 13 Apr 2014 09:12:56 +0300, Baruch Siach wrote:
> Drop obsolete/applied patches. Refresh the rest, and add sequence numbers.
> 
> Add a patch fixing build against uClibc when UCLIBC_HAS_LONG_DOUBLE_MATH is
> missing.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...gdlib-config.patch => gd-01-gdlib-config.patch} |  4 +-
>  .../gd/{gd-no-zlib.patch => gd-02-no-zlib.patch}   |  4 +-
>  .../gd/gd-03-gd_bmp-fix-build-with-uClibc.patch    | 50 ++++++++++++++++++++++
>  package/gd/gd-fontconfig.patch                     | 28 ------------
>  package/gd/gd-iconv.patch                          | 17 --------
>  package/gd/gd-libpng-config.patch                  | 30 -------------
>  package/gd/gd-maxcolors.patch                      | 20 ---------
>  package/gd/gd.mk                                   | 35 +++------------
>  8 files changed, 59 insertions(+), 129 deletions(-)
>  rename package/gd/{gd-gdlib-config.patch => gd-01-gdlib-config.patch} (94%)
>  rename package/gd/{gd-no-zlib.patch => gd-02-no-zlib.patch} (96%)
>  create mode 100644 package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch
>  delete mode 100644 package/gd/gd-fontconfig.patch
>  delete mode 100644 package/gd/gd-iconv.patch
>  delete mode 100644 package/gd/gd-libpng-config.patch
>  delete mode 100644 package/gd/gd-maxcolors.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
