From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 23:37:41 +0200
Subject: [Buildroot] [git commit branch/next] gcc: bump 4.8.x series to
	version 4.8.3
Message-ID: <20140522213806.10B6D9CD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acab108a7748384376063a0c0ccdd7ad0cee92bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update 900-musl-support.patch with upstreamed chunks.

Now upstreamed hence dropped:
840-PR57717.patch (in another way).
842-gcc-4.8.2-Fix-PR-target-58854.patch
843-gcc-4.8.2-Fix-PR-target-58595.patch
850-xtensa-libgcc-linker-script.patch

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.8.2/840-PR57717.patch                |   23 --
 .../4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch  |   32 --
 .../4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch  |  101 ------
 .../4.8.2/850-xtensa-libgcc-linker-script.patch    |   29 --
 package/gcc/{4.8.2 => 4.8.3}/100-uclibc-conf.patch |    0
 .../{4.8.2 => 4.8.3}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.8.2 => 4.8.3}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.8.2 => 4.8.3}/830-arm_unbreak_armv4t.patch  |    0
 .../gcc/{4.8.2 => 4.8.3}/841-PR57717-E500v2.patch  |   10 +-
 .../gcc/{4.8.2 => 4.8.3}/900-musl-support.patch    |  328 ++++++++------------
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    2 +-
 14 files changed, 134 insertions(+), 391 deletions(-)

Patch is too large, so refusing to show it
