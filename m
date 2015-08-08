From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:46 -0000
Subject: [Buildroot] [git commit branch/next] gcc: bump 5.x series to
	version 5.2.0
Message-ID: <20150808105636.4818A7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c51697185fdb5d165531f3adf3e8c4cd75509513
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also rename the BR2_GCC_VERSION_5_1_X symbol to BR2_GCC_VERSION_5_X to
reflect this change to match the new versioning scheme.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/{5.1.0 => 5.2.0}/100-uclibc-conf.patch |    0
 .../200-gcc-poison-system-directories.patch        |    0
 .../201-libgcc-remove-unistd-header.patch          |    0
 .../{5.1.0 => 5.2.0}/301-missing-execinfo_h.patch  |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{5.1.0 => 5.2.0}/830-arm_unbreak_armv4t.patch  |    0
 .../840-microblaze-enable-dwarf-eh-support.patch   |    0
 .../850-libstdcxx-uclibc-c99.patch                 |    0
 package/gcc/{5.1.0 => 5.2.0}/860-cilk-wchar.patch  |    0
 .../900-libitm-fixes-for-musl-support.patch        |    0
 .../901-fixincludes-update-for-musl-support.patch  |    0
 .../{5.1.0 => 5.2.0}/902-unwind-fix-for-musl.patch |    0
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |    0
 .../{5.1.0 => 5.2.0}/904-musl-libc-config.patch    |    0
 .../905-add-musl-support-to-gcc.patch              |    0
 .../{5.1.0 => 5.2.0}/906-mips-musl-support.patch   |    0
 .../{5.1.0 => 5.2.0}/907-x86-musl-support.patch    |    0
 .../{5.1.0 => 5.2.0}/908-arm-musl-support.patch    |    0
 .../909-aarch64-musl-support.patch                 |    0
 package/gcc/Config.in.host                         |    6 +++---
 package/gcc/gcc.hash                               |    4 ++--
 21 files changed, 5 insertions(+), 5 deletions(-)

Patch is too large, so refusing to show it
