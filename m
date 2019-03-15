From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsatoms: bump version
 to 1.1.3
Message-ID: <20190315203120.2E7CA83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=237eec6ad4b4038af910d5c5a396aa60b1aa2340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash | 9 +++++++--
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
index 58d0737b9d..de7eabe3be 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002579.html
-sha256	47e5dc7c3dbda6db2cf8c00cedac1722835c1550aa21cfdbc9ba83906694dea4	xlsatoms-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002951.html
+md5 61671fee12535347db24ec3a715032a7  xlsatoms-1.1.3.tar.bz2
+sha1 9fdb1e8df6bb08529a812ac90f63d500bf5174cc  xlsatoms-1.1.3.tar.bz2
+sha256 57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382  xlsatoms-1.1.3.tar.bz2
+sha512 c267ccfdc5a83e834bfb5c3b144e22642badcadef4eb146eeec2df6fe6f85e9379500ae4219912c70fa2e535036a1a96cf496381f5d814e79af075e03c975f30  xlsatoms-1.1.3.tar.bz2
+# Locally computed
+sha256 f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index d6d9338013..a3230fc2dc 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.2
+XAPP_XLSATOMS_VERSION = 1.1.3
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_LICENSE = MIT
