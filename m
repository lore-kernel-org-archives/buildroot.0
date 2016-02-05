From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:48:51 +0100
Subject: [Buildroot] [git commit] toolchain: bump ARC toolchain components
	to arc-2015.12
Message-ID: <20160205205333.4FF0B8016B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f25df488d74d951905374dbf7e7e30523679970f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change introduces newer ARC toolchain in Buildroot.

That new arc-2015.12 release doesn't bring any significant changes
but mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC: Source update to v4.8.5
 * GDB: Updated to upstream 7.10 release.

You may find more info on fixes and improvements in that release at:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch | 0
 .../600-poison-system-directories.patch                                 | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch | 0
 package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch   | 0
 .../900-UPDATE-Fix-handling-complex-PIC-moves.patch                     | 0
 .../901-UPDATE1-Fix-handling-complex-PIC-moves.patch                    | 0
 .../950-Don-t-allow-mcompact-casesi-for-ARCv2.patch                     | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 14 files changed, 7 insertions(+), 7 deletions(-)

Patch is too large, so refusing to show it
