From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed,  8 Jan 2014 10:33:01 -0600
Subject: [Buildroot] [PATCH 0/4] Microblaze Autobuilder Fixes
Message-ID: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a selection of fixes for Microblaze autobuild issues.

Spenser Gilliland (4):
  gdb: use consistent version on host and target for microblaze and arc
  libnspr: add microblaze support
  libsigsegv: fix for microblaze
  pixman: do not build demos or tests

 package/gdb/Config.in.host                         |  2 -
 package/gdb/gdb.mk                                 |  4 ++
 ...-nios2.patch => libnspr-microblaze-nios2.patch} | 59 ++++++++++++++++++++--
 .../libsigsegv-0003-fix-microblaze-build.patch     | 16 ++++++
 .../pixman/pixman-disable-demos-and-tests.patch    | 14 +++++
 5 files changed, 90 insertions(+), 5 deletions(-)
 rename package/libnspr/{libnspr-nios2.patch => libnspr-microblaze-nios2.patch} (59%)
 create mode 100644 package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
 create mode 100644 package/pixman/pixman-disable-demos-and-tests.patch

-- 
1.8.3.2
