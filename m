From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:46 -0000
Subject: [Buildroot] [git commit branch/next] ARC: update tools to
	arc-2015.06 release
Message-ID: <20150808105636.31C5E7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f0e184e402442331bd4cbe379721e109650f7a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

I'm happy to update GNU tools for ARC cores to the most recent
arc-2015.06 release.

This release brings following major improvements:
 * GCC: source update to v4.8.4
 * GCC: C ABI compatibility between MetaWare and GNU toolchains
 * uClibc: support for thread local storage and Native Pthread Library (NPTL)
 * GDB: updated to version 7.9.1

Also a lot of fixes and improvements has been done, please refer to
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.06
for more details.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |    2 +-
 .../0001-PR-other-56780.patch                      |    0
 .../600-poison-system-directories.patch            |    0
 package/binutils/binutils.hash                     |    2 +-
 package/binutils/binutils.mk                       |    2 +-
 package/gcc/Config.in.host                         |    2 +-
 .../100-libstdcxx-uclibc-c99.patch                 |    0
 .../851-PR-other-56780.patch                       |    0
 .../910-gcc-poison-system-directories.patch        |    0
 package/gcc/gcc.hash                               |    2 +-
 package/gdb/Config.in.host                         |    2 +-
 package/gdb/gdb.hash                               |    2 +-
 package/uclibc/Config.in                           |    2 +-
 package/uclibc/uclibc.hash                         |    2 +-
 14 files changed, 9 insertions(+), 9 deletions(-)

Patch is too large, so refusing to show it
