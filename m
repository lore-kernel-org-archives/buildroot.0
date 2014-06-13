From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 09:45:15 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.7.x series to version 4.7.4
Message-ID: <20140613074653.D750C9CFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c6ca668b86a13b726eb83301a92c5011fd09ee6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../4.7.3/850-xtensa-libgcc-linker-script.patch    |   29 --------------------
 package/gcc/{4.7.3 => 4.7.4}/100-uclibc-conf.patch |    0
 .../{4.7.3 => 4.7.4}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.7.3 => 4.7.4}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.7.3 => 4.7.4}/830-arm_unbreak_armv4t.patch  |    0
 .../843-gcc-4.7.3-Fix-PR-target-58595.patch        |    0
 .../gcc/{4.7.3 => 4.7.4}/900-musl-support.patch    |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    2 +-
 11 files changed, 1 insertions(+), 30 deletions(-)

Patch is too large, so refusing to show it
