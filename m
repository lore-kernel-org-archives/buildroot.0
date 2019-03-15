From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xvinfo: bump version to
 1.1.4
Message-ID: <20190315203120.56C3683480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88665095ee4d081273ea78389dcd32db46258e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash | 9 +++++++--
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
index 2077730fc9..405fc36ea6 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002596.html
-sha256	9fba8b68daf53863e66d5004fa9c703fcecf69db4d151ea2d3d885d621e6e5eb	xvinfo-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002955.html
+md5 b13afec137b9b331814a9824ab03ec80  xvinfo-1.1.4.tar.bz2
+sha1 136a70a72b23c81f4fe8f4c8cb7073316be16b44  xvinfo-1.1.4.tar.bz2
+sha256 0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f  xvinfo-1.1.4.tar.bz2
+sha512 85e1f936c5c826f0fdde3670bd77d5cde8641c6e8e7849e42142e91b5aa01d7e0e60d2b064eb6fef4f5666321813ca2dc9f9656756ccbe6dcda37b119ee8a63e  xvinfo-1.1.4.tar.bz2
+# Locally computed
+sha256 7725b0484faa1832534814ecb577f5a86acc74f1bcce25f92c55dfc1b693717d  COPYING
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 5b05a63233..7b3b97f073 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVINFO_VERSION = 1.1.3
+XAPP_XVINFO_VERSION = 1.1.4
 XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_LICENSE = MIT
