From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2016 19:30:31 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2016.09-eng005
In-Reply-To: <1468253418-26929-1-git-send-email-vzakhar@synopsys.com>
References: <1468253418-26929-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160711163031.GS3870@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vlad,

On Mon, Jul 11, 2016 at 07:10:18PM +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> 
> This engineering build fixes the kernel dwarf stack unwinder feature for
> ARC targets.
> 
> We still keep GDB as it is of arc-2016.03 release because there're some
> issues we'd like to resolve before releasing it to wider audience.
> 
> So again note this is next engineering builds of arc-2016.09 series
> and it might have all kinds of breakages, please don't use it for
> production builds.
> 
> Related to:
> 4520524ba055706236db9f00dd79f1b2e2e87fde

Your sign-off is missing.

baruch

> ---
>  package/binutils/Config.in.host                                         | 2 +-
>  .../{arc-2016.09-eng005 => arc-2016.09-eng006}/0300-ld-makefile.patch   | 0
>  .../0301-check-ldrunpath-length.patch                                   | 0
>  .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
>  .../0600-poison-system-directories.patch                                | 0
>  package/binutils/binutils.hash                                          | 2 +-
>  package/binutils/binutils.mk                                            | 2 +-
>  package/gcc/Config.in.host                                              | 2 +-
>  .../130-fix_build_with_gcc-6.patch                                      | 0
>  .../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/130-pr43538.patch    | 0
>  .../301-missing-execinfo_h.patch                                        | 0
>  .../305-libmudflap-susv3-legacy.patch                                   | 0
>  .../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/842-PR60155.patch    | 0
>  .../850-libstdcxx-uclibc-c99.patch                                      | 0
>  .../{arc-2016.09-eng005 => arc-2016.09-eng006}/851-PR-other-56780.patch | 0
>  .../930-libgcc-disable-split-stack-nothreads.patch                      | 0
>  package/gcc/gcc.hash                                                    | 2 +-
>  17 files changed, 5 insertions(+), 5 deletions(-)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
