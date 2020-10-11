From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 00:03:32 +0200
Subject: [Buildroot] [PATCH] package/quazip: bump to 1.1
In-Reply-To: <20201011171259.2156928-1-zgyarmati@zgyarmati.de>
References: <20201011171259.2156928-1-zgyarmati@zgyarmati.de>
Message-ID: <20201012000332.36a307bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Oct 2020 19:12:59 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Also dropping upstream patch.
> With this release quazip drops the qmake build in favour of cmake.
> It still ships the pkgconfig .pc file, so it's possible to link to
> it by using CMake's find_package() or with pkgconfig.
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  .../quazip/0001-fix-qztest-build-error.patch  | 36 -------------------
>  package/quazip/quazip.hash                    |  2 +-
>  package/quazip/quazip.mk                      | 19 ++--------
>  3 files changed, 3 insertions(+), 54 deletions(-)
>  delete mode 100644 package/quazip/0001-fix-qztest-build-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
