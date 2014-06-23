From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 10:10:18 +0200
Subject: [Buildroot] [git commit] orc: bump version
Message-ID: <20140623093923.8A5279D09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cc2be61c4857c1277ed294b003f0b611b9ebbd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarball no longer available in .gz format. From the release notes:

  - Fix list corruption when splitting code memory chunks, causing crashes
    when allocating a lot of code memory and trying to free it later
    (Tim-Philipp M??ller)
  - Add some extra checks for the number of variables used in ORC code to
    prevent overflows and crashes in the compiler (Vincent Penquerc'h)
  - Various compiler warnings, coverity warnings and static code analysis
    fixes (Sebastian Dr??ge)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index b67823f..a2165f7 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.19
+ORC_VERSION = 0.4.20
+ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc/
 ORC_LICENSE = BSD-2c, BSD-3c
 ORC_LICENSE_FILES = COPYING
