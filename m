From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:05:19 +0100
Subject: [Buildroot] [git commit] gcc: bump 4.9.x series to version 4.9.2
Message-ID: <20141030180540.F166CB2214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db4db9ebccec95a825e254449683ff62293e5892
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop PR60102 patch which is now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.9.1/841-PR60102.patch                |  388 --------------------
 package/gcc/{4.9.1 => 4.9.2}/100-uclibc-conf.patch |    0
 .../{4.9.1 => 4.9.2}/301-missing-execinfo_h.patch  |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.9.1 => 4.9.2}/830-arm_unbreak_armv4t.patch  |    0
 .../840-microblaze-enable-dwarf-eh-support.patch   |    0
 .../850-libstdcxx-uclibc-c99.patch                 |    0
 .../gcc/{4.9.1 => 4.9.2}/900-musl-support.patch    |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    2 +-
 10 files changed, 1 insertions(+), 389 deletions(-)

Patch is too large, so refusing to show it
