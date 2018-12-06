From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:09:51 +0100
Subject: [Buildroot] [PATCH] toolchain: Fix URL's for ARC
 gcc/binutils/gdb
In-Reply-To: <20181206141733.4059-1-Evgeniy.Didin@synopsys.com>
References: <20181206141733.4059-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20181206210951.3e529ca3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Dec 2018 17:17:33 +0300, Evgeniy Didin wrote:
> In recent Update-ARC-toolchain patches URL's for GCC, Binutils and
> GDB are mistakenly pointing to HEAD of the corresponding branches. 
> This patch fixes mistake and for ARC toolchain switches GCC, Binutils 
> and GDB to fixed "release" tags.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/binutils/Config.in.host                                     | 2 +-
>  .../0005-poison-system-directories.patch                            | 0
>  package/binutils/binutils.hash                                      | 2 +-
>  package/binutils/binutils.mk                                        | 6 +++---
>  package/gcc/Config.in.host                                          | 2 +-
>  .../gcc/{arc-2018.09 => arc-2018.09-release}/0100-uclibc-conf.patch | 0
>  package/gcc/gcc.hash                                                | 2 +-
>  package/gdb/Config.in.host                                          | 2 +-
>  package/gdb/gdb.hash                                                | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>  rename package/binutils/{arc-2018.09 => arc-2018.09-release}/0005-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2018.09 => arc-2018.09-release}/0100-uclibc-conf.patch (100%)

Applied to master after reworking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
