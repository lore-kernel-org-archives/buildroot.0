From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:15:22 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2016.09-eng015
In-Reply-To: <1475486556-41668-1-git-send-email-vzakhar@synopsys.com>
References: <1475486556-41668-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161003231522.1eb193bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Oct 2016 12:22:36 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> This time we're updating tools to arc-2016.09-eng015.
> 
> This tag introduces following changes:
> 1. binutils: Rebase onto upstream master.
> 2. gcc: Fix devdf3 emulation for arcem, disable TP register when
> building for bare metal.
> 
> We still keep GDB as it is of arc-2016.03 release because there're some
> issues we'd like to resolve before releasing it to wider audience.
> 
> So again note this is next engineering builds of arc-2016.09 series
> and it might have all kinds of breakages, please don't use it for
> production builds.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  package/binutils/Config.in.host                                         | 2 +-
>  .../{arc-2016.09-eng013 => arc-2016.09-eng015}/0300-ld-makefile.patch   | 0
>  .../0301-check-ldrunpath-length.patch                                   | 0
>  .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
>  .../0600-poison-system-directories.patch                                | 0
>  package/binutils/binutils.hash                                          | 2 +-
>  package/binutils/binutils.mk                                            | 2 +-
>  package/gcc/Config.in.host                                              | 2 +-
>  .../301-missing-execinfo_h.patch                                        | 0
>  .../gcc/{arc-2016.09-eng013 => arc-2016.09-eng015}/860-cilk-wchar.patch | 0
>  .../940-uclinux-enable-threads.patch                                    | 0
>  package/gcc/gcc.hash                                                    | 2 +-
>  12 files changed, 5 insertions(+), 5 deletions(-)
>  rename package/binutils/{arc-2016.09-eng013 => arc-2016.09-eng015}/0300-ld-makefile.patch (100%)
>  rename package/binutils/{arc-2016.09-eng013 => arc-2016.09-eng015}/0301-check-ldrunpath-length.patch (100%)
>  rename package/binutils/{arc-2016.09-eng013 => arc-2016.09-eng015}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
>  rename package/binutils/{arc-2016.09-eng013 => arc-2016.09-eng015}/0600-poison-system-directories.patch (100%)
>  rename package/gcc/{arc-2016.09-eng013 => arc-2016.09-eng015}/301-missing-execinfo_h.patch (100%)
>  rename package/gcc/{arc-2016.09-eng013 => arc-2016.09-eng015}/860-cilk-wchar.patch (100%)
>  rename package/gcc/{arc-2016.09-eng013 => arc-2016.09-eng015}/940-uclinux-enable-threads.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
