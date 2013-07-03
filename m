From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 22:09:12 +0200
Subject: [Buildroot] [git commit] elf2flt: convert to the package
	infrastructure
Message-ID: <20130704095649.422E69A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e21db000267cfbff000f1fc8c8e3329c5473ce1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Correct legacy position]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |    8 +++
 .../Config.in => package/elf2flt/Config.in.host    |    2 +-
 package/elf2flt/elf2flt.mk                         |   28 ++++++++++++
 .../elf2flt => package/elf2flt/src}/LICENSE.TXT    |    0
 .../elf2flt => package/elf2flt/src}/Makefile.in    |    0
 .../elf2flt/elf2flt => package/elf2flt/src}/README |    0
 .../elf2flt => package/elf2flt/src}/config.guess   |    0
 .../elf2flt => package/elf2flt/src}/config.sub     |    0
 .../elf2flt => package/elf2flt/src}/configure      |    0
 .../elf2flt => package/elf2flt/src}/configure.in   |    0
 .../elf2flt => package/elf2flt/src}/cygwin-elf.h   |    0
 .../elf2flt => package/elf2flt/src}/e1-elf2flt.ld  |    0
 .../elf2flt => package/elf2flt/src}/elf2flt.c      |    0
 .../elf2flt => package/elf2flt/src}/elf2flt.ld     |    0
 .../elf2flt/elf2flt => package/elf2flt/src}/flat.h |    0
 .../elf2flt => package/elf2flt/src}/flthdr.c       |    0
 .../elf2flt => package/elf2flt/src}/install-sh     |    0
 .../elf2flt => package/elf2flt/src}/ld-elf2flt.in  |    0
 .../elf2flt => package/elf2flt/src}/maketarball.sh |    0
 .../elf2flt => package/elf2flt/src}/stubs.c        |    0
 toolchain/elf2flt/elf2flt.mk                       |   46 --------------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    2 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 25 files changed, 38 insertions(+), 51 deletions(-)

Patch is too large, so refusing to show it
