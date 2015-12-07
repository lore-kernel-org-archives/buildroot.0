From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2015 08:34:33 +0100
Subject: [Buildroot] [git commit] gcc: bump 5.x series to version 5.3.0
Message-ID: <20151207073617.32CBA81991@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0c39672e958dac5cff800d101cbf00fdf401ff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

201-libgcc-remove-unistd-header.patch is upstream so remove it.
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch    | 14 --------------
 package/gcc/{5.2.0 => 5.3.0}/100-uclibc-conf.patch         |  0
 ...-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/301-missing-execinfo_h.patch  |  0
 .../gcc/{5.2.0 => 5.3.0}/810-arm-softfloat-libgcc.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/830-arm_unbreak_armv4t.patch  |  0
 .../840-microblaze-enable-dwarf-eh-support.patch           |  0
 .../gcc/{5.2.0 => 5.3.0}/850-libstdcxx-uclibc-c99.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/860-cilk-wchar.patch          |  0
 .../870-xtensa-add-mauto-litpools-option.patch             |  0
 .../871-xtensa-reimplement-register-spilling.patch         |  0
 ...nsa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  0
 .../{5.2.0 => 5.3.0}/873-xtensa-fix-_Unwind_GetCFA.patch   |  0
 .../900-libitm-fixes-for-musl-support.patch                |  0
 .../901-fixincludes-update-for-musl-support.patch          |  0
 package/gcc/{5.2.0 => 5.3.0}/902-unwind-fix-for-musl.patch |  0
 ...03-libstdc++-libgfortran-gthr-workaround-for-musl.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/904-musl-libc-config.patch    |  0
 .../gcc/{5.2.0 => 5.3.0}/905-add-musl-support-to-gcc.patch |  0
 package/gcc/{5.2.0 => 5.3.0}/906-mips-musl-support.patch   |  0
 package/gcc/{5.2.0 => 5.3.0}/907-x86-musl-support.patch    |  0
 package/gcc/{5.2.0 => 5.3.0}/908-arm-musl-support.patch    |  0
 .../gcc/{5.2.0 => 5.3.0}/909-aarch64-musl-support.patch    |  0
 package/gcc/Config.in.host                                 |  2 +-
 package/gcc/gcc.hash                                       |  4 ++--
 25 files changed, 3 insertions(+), 17 deletions(-)

Patch is too large, so refusing to show it
