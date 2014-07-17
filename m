From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:58:21 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.9.x series to version 4.9.1
Message-ID: <20140717185826.5F9CE9D1EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00bf63600ed45643decd0a0dd21006af4b9b838a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/{4.9.0 => 4.9.1}/100-uclibc-conf.patch |    0
 .../{4.9.0 => 4.9.1}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.9.0 => 4.9.1}/302-c99-snprintf.patch    |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.9.0 => 4.9.1}/830-arm_unbreak_armv4t.patch  |    0
 .../840-microblaze-enable-dwarf-eh-support.patch   |    0
 .../gcc/{4.9.0 => 4.9.1}/900-musl-support.patch    |   16 +---------------
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    2 +-
 9 files changed, 2 insertions(+), 16 deletions(-)

Patch is too large, so refusing to show it
