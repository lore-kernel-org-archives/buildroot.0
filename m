From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 23:59:11 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng006
Message-ID: <20160714102606.6F7C181F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c88d54746069562a3a3b9a5c1e2c69f7692c5f5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.

This engineering build fixes the kernel dwarf stack unwinder feature for
ARC targets.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Related to:
4520524ba055706236db9f00dd79f1b2e2e87fde

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-eng005 => arc-2016.09-eng006}/0300-ld-makefile.patch   | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../130-fix_build_with_gcc-6.patch                                      | 0
 .../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/130-pr43538.patch    | 0
 .../301-missing-execinfo_h.patch                                        | 0
 .../305-libmudflap-susv3-legacy.patch                                   | 0
 .../gcc/{arc-2016.09-eng005 => arc-2016.09-eng006}/842-PR60155.patch    | 0
 .../850-libstdcxx-uclibc-c99.patch                                      | 0
 .../{arc-2016.09-eng005 => arc-2016.09-eng006}/851-PR-other-56780.patch | 0
 .../930-libgcc-disable-split-stack-nothreads.patch                      | 0
 package/gcc/gcc.hash                                                    | 2 +-
 17 files changed, 5 insertions(+), 5 deletions(-)

Patch is too large, so refusing to show it
