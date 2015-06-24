From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Jun 2015 09:20:43 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.8.x version
Message-ID: <20150624072234.3F6E6807A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7654d687b2de8c7764e4b4cb060e1c7946b19727
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/{4.8.4 => 4.8.5}/100-uclibc-conf.patch |    0
 ...00-powerpc-link-with-math-lib.patch.conditional |    0
 package/gcc/{4.8.4 => 4.8.5}/111-pr65730.patch     |    0
 .../{4.8.4 => 4.8.5}/301-missing-execinfo_h.patch  |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.8.4 => 4.8.5}/830-arm_unbreak_armv4t.patch  |    0
 .../gcc/{4.8.4 => 4.8.5}/841-PR57717-E500v2.patch  |    0
 package/gcc/{4.8.4 => 4.8.5}/842-PR60155.patch     |    0
 .../843-aarch64-vmlaq_lane_s32-typo.patch          |    0
 .../850-libstdcxx-uclibc-c99.patch                 |    0
 .../gcc/{4.8.4 => 4.8.5}/851-PR-other-56780.patch  |    0
 .../gcc/{4.8.4 => 4.8.5}/900-musl-support.patch    |    0
 .../910-gcc-poison-system-directories.patch        |    0
 package/gcc/Config.in.host                         |    2 +-
 package/gcc/gcc.hash                               |    4 ++--
 16 files changed, 3 insertions(+), 3 deletions(-)

Patch is too large, so refusing to show it
