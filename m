From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 17:19:58 +0100
Subject: [Buildroot] [git commit] gcc: bump 6.x series to version 6.3.0
Message-ID: <20161221165223.C14F2803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be1a3a3e4610deb9434329da643bf7b896989276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/{6.2.0 => 6.3.0}/100-uclibc-conf.patch                    | 0
 package/gcc/{6.2.0 => 6.3.0}/301-missing-execinfo_h.patch             | 0
 package/gcc/{6.2.0 => 6.3.0}/810-arm-softfloat-libgcc.patch           | 0
 package/gcc/{6.2.0 => 6.3.0}/830-arm_unbreak_armv4t.patch             | 0
 .../831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch    | 0
 package/gcc/{6.2.0 => 6.3.0}/860-cilk-wchar.patch                     | 0
 package/gcc/{6.2.0 => 6.3.0}/870-xtensa-Fix-PR-target-78118.patch     | 0
 package/gcc/{6.2.0 => 6.3.0}/871-xtensa-Fix-PR-target-78603.patch     | 0
 package/gcc/{6.2.0 => 6.3.0}/890-fix-m68k-compile.patch               | 0
 package/gcc/{6.2.0 => 6.3.0}/891-fix-m68k-uclinux.patch               | 0
 .../892-libgcc-mkmap-symver-support-skip_underscore.patch             | 0
 .../893-libgcc-config-bfin-use-the-generic-linker-version-in.patch    | 0
 .../894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch         | 0
 package/gcc/{6.2.0 => 6.3.0}/895-bfin-define-REENTRANT.patch          | 0
 package/gcc/{6.2.0 => 6.3.0}/940-uclinux-enable-threads.patch         | 0
 .../gcc/{6.2.0 => 6.3.0}/941-mips-Add-support-for-mips-r6-musl.patch  | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 18 files changed, 3 insertions(+), 3 deletions(-)

Patch is too large, so refusing to show it
