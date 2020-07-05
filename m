From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:13:30 +0200
Subject: [Buildroot] [PATCH] package/lshw: bump version to 02.19.2
In-Reply-To: <20200704235045.24559-1-sergio.prado@e-labworks.com>
References: <20200704235045.24559-1-sergio.prado@e-labworks.com>
Message-ID: <20200705151330.5dcbf6ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jul 2020 20:50:45 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Remove patch 0001 (changes already upstream) and rework patches 0002 and
> 0003 (merge request sent upstream [1])
> 
> [1] https://github.com/lyonel/lshw/pull/56
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...x-musl-build-basename-is-in-libgen.h.patch | 101 ++++++++++++++++++
>  ...kefile-allow-to-pass-additional-LIBS.patch |  44 --------
>  ...x-musl-build-basename-is-in-libgen.h.patch |  78 --------------
>  ...-musl-build-wrong-usage-of-LONG_BIT.patch} |  26 ++---
>  package/lshw/lshw.hash                        |   2 +-
>  package/lshw/lshw.mk                          |   2 +-
>  6 files changed, 117 insertions(+), 136 deletions(-)
>  create mode 100644 package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
>  delete mode 100644 package/lshw/0001-Makefile-allow-to-pass-additional-LIBS.patch
>  delete mode 100644 package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
>  rename package/lshw/{0003-Fix-use-of-LONG_BIT.patch => 0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch} (53%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
