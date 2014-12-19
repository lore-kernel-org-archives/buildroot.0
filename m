From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Dec 2014 21:42:51 +0100
Subject: [Buildroot] [git commit] gcc: bump 4.8.x series to version 4.8.4
Message-ID: <20141219210206.6FC9B7FD99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e8fc282f832d16e8edacfc25dfb5ae9a426d667
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/{4.8.3 => 4.8.4}/100-uclibc-conf.patch |    0
 .../{4.8.3 => 4.8.4}/301-missing-execinfo_h.patch  |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.8.3 => 4.8.4}/830-arm_unbreak_armv4t.patch  |    0
 .../gcc/{4.8.3 => 4.8.4}/841-PR57717-E500v2.patch  |    0
 package/gcc/{4.8.3 => 4.8.4}/842-PR60155.patch     |    0
 .../850-libstdcxx-uclibc-c99.patch                 |    0
 .../gcc/{4.8.3 => 4.8.4}/900-musl-support.patch    |    0
 .../910-gcc-poison-system-directories.patch        |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)

Patch is too large, so refusing to show it
