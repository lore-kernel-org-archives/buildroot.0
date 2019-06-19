From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:50:40 +0200
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2019.03
 release
In-Reply-To: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
References: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190619135040.188ebb3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 12:25:32 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> This commit finally bumps ARC tools to the most recent arc-2018.09 release version.
> 
> ARC GNU tools of version arc-2018.09 bring some quite significant changes like:
>  * Binutils v2.32.51.20190308 with additional ARC patches
>  * GCC 8.3.1 with additional ARC patches
>  * glibc 2.29 with additional ARC patches
> More information on this release could be found here:
>  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.03-release
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> ---
>  package/binutils/Config.in.host                                       | 2 +-
>  .../0001-poison-system-directories.patch                              | 0
>  package/binutils/binutils.hash                                        | 2 +-
>  package/binutils/binutils.mk                                          | 4 ++--
>  package/gcc/Config.in.host                                            | 2 +-
>  .../{arc-2019.03-rc1 => arc-2019.03-release}/0100-uclibc-conf.patch   | 0
>  package/gcc/gcc.hash                                                  | 2 +-
>  package/gdb/Config.in.host                                            | 2 +-
>  package/gdb/gdb.hash                                                  | 2 +-
>  package/glibc/{arc-2019.03-rc1 => arc-2019.03-release}/glibc.hash     | 2 +-
>  package/glibc/glibc.mk                                                | 2 +-
>  11 files changed, 10 insertions(+), 10 deletions(-)
>  rename package/binutils/{arc-2019.03-rc1 => arc-2019.03-release}/0001-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2019.03-rc1 => arc-2019.03-release}/0100-uclibc-conf.patch (100%)
>  rename package/glibc/{arc-2019.03-rc1 => arc-2019.03-release}/glibc.hash (75%)

Applied to master after fixing the typoes in the commit log that were
pointed by Baruch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
