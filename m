From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:01:37 +0100
Subject: [Buildroot] [git commit] toolchain: bump ARC toolchain components
	to arc-2015.12-rc1
Message-ID: <20160119210353.E6378827D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e10860f644e5c09ee65c7c358e5e6059df94281e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change introduces newer ARC toolchain in Buildroot.
Note this is the first release candidate and we'll probably see another
RC before cutting the final release.

That new arc-2015.12 release doesn't bring any significant changes but
mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC updated to v4.8.5
 * GDB updated to 7.10

You may find more info on fixes and improvements in that release at:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12-rc1

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0002-ld-arc-Provide-the-.tdata-symbol.patch    | 145 ---------------------
 .../arc-2015.06/0003-Provide-.tbss-symbol.patch    |  70 ----------
 ...e-if-the-input-BFD-actually-contains-any-.patch | 132 -------------------
 ...tire-object-if-it-contains-only-data-sect.patch |  35 -----
 .../0001-PR-other-56780.patch                      |   0
 .../600-poison-system-directories.patch            |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 ...iate-between-a-bss-TLS-initialized-symbol.patch |  42 ------
 .../0001-Handle-correctly-compare-arguments.patch  |  71 ----------
 .../100-libstdcxx-uclibc-c99.patch                 |   0
 .../851-PR-other-56780.patch                       |   0
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 17 files changed, 7 insertions(+), 502 deletions(-)

Patch is too large, so refusing to show it
