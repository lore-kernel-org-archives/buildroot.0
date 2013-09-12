From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:27:08 +0200
Subject: [Buildroot] [git commit] elf2flt: upgrade to latest version
Message-ID: <20130912223326.01B549B723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=338aee6ca6b906b775b91f90e6f83bd96804364a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrade to the latest uclinux CVS snapshot, gives us blackfin support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elf2flt/Config.in.host     |    2 +-
 package/elf2flt/elf2flt.mk         |   10 +-
 package/elf2flt/src/LICENSE.TXT    |  340 ---
 package/elf2flt/src/Makefile.in    |   81 -
 package/elf2flt/src/README         |   62 -
 package/elf2flt/src/config.guess   | 1418 -----------
 package/elf2flt/src/config.sub     | 1577 ------------
 package/elf2flt/src/configure      | 4719 ------------------------------------
 package/elf2flt/src/configure.in   |  134 -
 package/elf2flt/src/cygwin-elf.h   | 2171 -----------------
 package/elf2flt/src/e1-elf2flt.ld  |  161 --
 package/elf2flt/src/elf2flt.c      | 2152 ----------------
 package/elf2flt/src/elf2flt.ld     |  179 --
 package/elf2flt/src/flat.h         |  111 -
 package/elf2flt/src/flthdr.c       |  382 ---
 package/elf2flt/src/install-sh     |  251 --
 package/elf2flt/src/ld-elf2flt.in  |  219 --
 package/elf2flt/src/maketarball.sh |   12 -
 package/elf2flt/src/stubs.c        |    6 -
 19 files changed, 4 insertions(+), 13983 deletions(-)

Patch is too large, so refusing to show it
