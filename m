From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:24:30 +0100
Subject: [Buildroot] [PATCHv2] toolchain: Bump ARC tools to arc-2017.09
 release
In-Reply-To: <20171101140431.33365-1-didin@synopsys.com>
References: <20171101140431.33365-1-didin@synopsys.com>
Message-ID: <20171123232430.627ddac7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Nov 2017 17:04:31 +0300, Evgeniy Didin wrote:
> This commit finally bumps ARC tools to the most recent arc-2017.09 release version.
> 
> ARC GNU tools of version arc-2017.09 bring some quite significant changes like:
>  * Binutils v2.29 with additonal ARC patches
>  * GCC 7.1.1 with additional ARC patches
>  * glibc 2.26 with additional ARC patches
> 
> More information on this release could be found here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.09-release
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
>  package/binutils/Config.in.host                    |  2 +-
>  .../0002-ld-makefile.patch                         |  0
>  .../0003-check-ldrunpath-length.patch              |  0
>  .../0004-add-sysroot-fix-from-bug-3049.patch       |  0
>  .../0005-poison-system-directories.patch           |  0
>  package/binutils/binutils.hash                     |  2 +-
>  package/binutils/binutils.mk                       |  2 +-
>  package/gcc/Config.in.host                         |  2 +-
>  .../0910-Update-uses-for-hw-loop-labels.patch      | 63 ----------------------
>  .../0100-uclibc-conf.patch                         |  0
>  .../0860-cilk-fix-build-without-wchar.patch        |  0
>  .../0900-remove-selftests.patch                    |  0
>  package/gcc/gcc.hash                               |  2 +-
>  package/gdb/Config.in.host                         |  2 +-
>  package/gdb/gdb.hash                               |  2 +-
>  package/glibc/glibc.hash                           |  2 +-
>  package/glibc/glibc.mk                             |  2 +-
>  17 files changed, 9 insertions(+), 72 deletions(-)
>  rename package/binutils/{arc-2017.09-rc1 => arc-2017.09-release}/0002-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2017.09-rc1 => arc-2017.09-release}/0003-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2017.09-rc1 => arc-2017.09-release}/0004-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2017.09-rc1 => arc-2017.09-release}/0005-poison-system-directories.patch (100%)
>  delete mode 100644 package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
>  rename package/gcc/{arc-2017.09-rc1 => arc-2017.09-release}/0100-uclibc-conf.patch (100%)
>  rename package/gcc/{arc-2017.09-rc1 => arc-2017.09-release}/0860-cilk-fix-build-without-wchar.patch (100%)
>  rename package/gcc/{arc-2017.09-rc1 => arc-2017.09-release}/0900-remove-selftests.patch (100%)

It seems like I have forgotten to say that this patch has been applied.
It was applied on November 3rd.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
