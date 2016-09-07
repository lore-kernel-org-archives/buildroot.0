From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 10:29:58 +0200
Subject: [Buildroot] [git commit] gcc: bump 6.x series to 6.2.0
Message-ID: <20160907083346.83DC68184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac9b7ef51bfb3bd4d3bcdbc424cdcbc993c074ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust some patches to avoid patching the ChangeLog which isn't quite
the same.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/{6.1.0 => 6.2.0}/100-uclibc-conf.patch   |  0
 .../{6.1.0 => 6.2.0}/301-missing-execinfo_h.patch    |  0
 .../{6.1.0 => 6.2.0}/810-arm-softfloat-libgcc.patch  |  0
 .../{6.1.0 => 6.2.0}/830-arm_unbreak_armv4t.patch    |  0
 package/gcc/{6.1.0 => 6.2.0}/860-cilk-wchar.patch    |  0
 .../gcc/{6.1.0 => 6.2.0}/890-fix-m68k-compile.patch  |  0
 .../gcc/{6.1.0 => 6.2.0}/891-fix-m68k-uclinux.patch  |  0
 ...libgcc-mkmap-symver-support-skip_underscore.patch | 16 +---------------
 ...nfig-bfin-use-the-generic-linker-version-in.patch | 20 +-------------------
 ...cc-fix-DWARF-compilation-with-FDPIC-targets.patch | 16 +---------------
 .../940-uclinux-enable-threads.patch                 |  0
 package/gcc/Config.in.host                           |  2 +-
 package/gcc/gcc.hash                                 |  4 ++--
 13 files changed, 6 insertions(+), 52 deletions(-)

Patch is too large, so refusing to show it
