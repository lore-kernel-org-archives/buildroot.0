From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:32:01 +0200
Subject: [Buildroot] [PATCH] package/popt: bump to version 1.18
In-Reply-To: <20200918193708.277053-1-francois.perrad@gadz.org>
References: <20200918193708.277053-1-francois.perrad@gadz.org>
Message-ID: <20200919143201.13f752d8@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 21:37:08 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> - update home page URL
> - change download to new location
> - remove old patches (first release since 2010)
> - autoreconf now useless
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/popt/0001-no-wchar.patch              | 12 ------
>  package/popt/0002-fix-autoreconf.patch        | 38 -----------------
>  package/popt/0003-glob-detection.patch        | 41 -------------------
>  .../popt/0004-add-libiconv-to-popt.pc.patch   |  8 ++--
>  package/popt/Config.in                        |  2 +-
>  package/popt/popt.hash                        |  4 +-
>  package/popt/popt.mk                          |  5 +--
>  7 files changed, 9 insertions(+), 101 deletions(-)
>  delete mode 100644 package/popt/0001-no-wchar.patch
>  delete mode 100644 package/popt/0002-fix-autoreconf.patch
>  delete mode 100644 package/popt/0003-glob-detection.patch

I renumbered the remaining 0004 patch to 0001, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
