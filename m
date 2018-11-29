From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 21:42:13 +0100
Subject: [Buildroot] [PATCH-next] toolchain: bumb ARC tools to
 arc-2018.09 release
In-Reply-To: <20181127110411.47020-1-Evgeniy.Didin@synopsys.com>
References: <20181127110411.47020-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20181129214213.6aa97efd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Nov 2018 14:04:11 +0300, Evgeniy Didin wrote:
> This commit finally bumps ARC tools to the most recent arc-2018.09 release version.
> 
> ARC GNU tools of version arc-2018.09 bring some quite significant changes like:
>  * Binutils v2.31.1 with additional ARC patches
>  * GCC 8.2.1 with additional ARC patches
>  * glibc 2.28 with additional ARC patches
> 
> More information on this release could be found here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2018.09-release
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/binutils/Config.in.host                                       | 2 +-
>  .../0005-poison-system-directories.patch                              | 0
>  package/binutils/binutils.hash                                        | 2 +-
>  package/binutils/binutils.mk                                          | 4 ++--
>  package/gcc/Config.in.host                                            | 2 +-
>  package/gcc/{arc-2018.09-rc2 => arc-2018.09}/0100-uclibc-conf.patch   | 0
>  package/gcc/gcc.hash                                                  | 2 +-
>  package/gdb/Config.in.host                                            | 2 +-
>  package/gdb/gdb.hash                                                  | 2 +-
>  package/glibc/{arc-2018.09-rc2 => arc-2018.09-release}/glibc.hash     | 2 +-
>  package/glibc/glibc.mk                                                | 2 +-
>  11 files changed, 10 insertions(+), 10 deletions(-)
>  rename package/binutils/{arc-2018.09-rc2 => arc-2018.09}/0005-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2018.09-rc2 => arc-2018.09}/0100-uclibc-conf.patch (100%)
>  rename package/glibc/{arc-2018.09-rc2 => arc-2018.09-release}/glibc.hash (75%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
