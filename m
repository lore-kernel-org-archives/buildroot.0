From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:51 +0100
Subject: [Buildroot] [PATCH v2 13/22] package/x11r7/xapp_xrdb: bump version
 to 1.1.1
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrdb/xapp_xrdb.hash | 9 +++++++--
 package/x11r7/xapp_xrdb/xapp_xrdb.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.hash b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
index 4844a09b4a..c729861724 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.hash
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002316.html
-sha256	73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641698d7dc541ca565b	xrdb-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002871.html
+md5 96f9423eab4d0641c70848d665737d2e  xrdb-1.1.1.tar.bz2
+sha1 0d6b1cae357574d565d6e6bc10f6ccf073e1b9dd  xrdb-1.1.1.tar.bz2
+sha256 2d23ade7cdbb487996bf77cbb32cbe9bdb34d004748a53de7a4a97660d2217b7  xrdb-1.1.1.tar.bz2
+sha512 20c342004ef911fc4d3ef4ac3ac15d1c30bb946b8156f3a6916c242e470be0cb63261563462fd1e2e07b1a7cc527b8cacf5f913e31b02196629a95043cf8d13f  xrdb-1.1.1.tar.bz2
+# Locally computed
+sha256 ca1b3e2f9f37c35876b69a9c1c5a7860fae59b7ba87a1d2dc541b722e29b1ecc COPYING
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index f32afa45ab..4b84c64a92 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRDB_VERSION = 1.1.0
+XAPP_XRDB_VERSION = 1.1.1
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_LICENSE = MIT
-- 
2.11.0
