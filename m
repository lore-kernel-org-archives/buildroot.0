From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:18:27 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2019.09-eng002
In-Reply-To: <20191015090258.46280-1-Evgeniy.Didin@synopsys.com>
References: <20191015090258.46280-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20191027201827.1bdbcd10@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 12:02:58 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> This commit bumps ARC toolchain to arc-2019.09-eng002.
> We want to test how new toolchain-eng002 builds packages,
> so we can make fixes before release of toolcain.
> 
> Please note that it is an engineering build and it might have
> all kinds of breakages, please don't use it for production builds
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> 
> ---
>  package/binutils/Config.in.host                    |   2 +-
>  .../0001-poison-system-directories.patch           |  61 ++--
>  package/binutils/binutils.hash                     |   2 +-
>  package/binutils/binutils.mk                       |   4 +-
>  package/gcc/Config.in.host                         |   6 +-
>  .../gcc/arc-2019.03-release/0001-ARC-PR89838.patch | 369 ---------------------
>  .../0002-ARC-Fix-emitting-TLS-symbols.patch        |  61 ----
>  .../0100-uclibc-conf.patch                         |   0
>  package/gcc/gcc.hash                               |   2 +-
>  package/gdb/Config.in.host                         |   2 +-
>  package/gdb/gdb.hash                               |   2 +-
>  .../glibc.hash                                     |   2 +-
>  package/glibc/glibc.mk                             |   2 +-
>  13 files changed, 44 insertions(+), 471 deletions(-)
>  rename package/binutils/{arc-2019.03-release => arc-2019.09-eng002}/0001-poison-system-directories.patch (86%)
>  delete mode 100644 package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
>  delete mode 100644 package/gcc/arc-2019.03-release/0002-ARC-Fix-emitting-TLS-symbols.patch
>  rename package/gcc/{arc-2019.03-release => arc-2019.09-eng002}/0100-uclibc-conf.patch (100%)
>  rename package/glibc/{arc-2019.03-release => arc-2019.09-eng002}/glibc.hash (75%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
