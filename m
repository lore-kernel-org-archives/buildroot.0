From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xrdb: bump version to
 1.2.0
Message-ID: <20190315203120.4985683480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f64039a6cc9e7d9ff09194dd5d93fb2b93d866d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xrdb/xapp_xrdb.hash | 10 +++++-----
 package/x11r7/xapp_xrdb/xapp_xrdb.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.hash b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
index c729861724..b8a6896ca7 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.hash
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002871.html
-md5 96f9423eab4d0641c70848d665737d2e  xrdb-1.1.1.tar.bz2
-sha1 0d6b1cae357574d565d6e6bc10f6ccf073e1b9dd  xrdb-1.1.1.tar.bz2
-sha256 2d23ade7cdbb487996bf77cbb32cbe9bdb34d004748a53de7a4a97660d2217b7  xrdb-1.1.1.tar.bz2
-sha512 20c342004ef911fc4d3ef4ac3ac15d1c30bb946b8156f3a6916c242e470be0cb63261563462fd1e2e07b1a7cc527b8cacf5f913e31b02196629a95043cf8d13f  xrdb-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002953.html
+md5 34ae801ef994d192c70fcce2bdb2a1b2  xrdb-1.2.0.tar.bz2
+sha1 79596928246288a217abdec0e4a2315ec9b07963  xrdb-1.2.0.tar.bz2
+sha256 f23a65cfa1f7126040d68b6cf1e4567523edac10f8dc06f23d840d330c7c6946  xrdb-1.2.0.tar.bz2
+sha512 14e1cdfb2152fb28f1f4641b177ab236648d7e967a95b952bf4cfce8d3e1ef085e85385354e3381aaf644462e8888a1847f755ab4016ecb4cb4a715b001dd2ef  xrdb-1.2.0.tar.bz2
 # Locally computed
 sha256 ca1b3e2f9f37c35876b69a9c1c5a7860fae59b7ba87a1d2dc541b722e29b1ecc COPYING
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 4b84c64a92..b445805d17 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRDB_VERSION = 1.1.1
+XAPP_XRDB_VERSION = 1.2.0
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_LICENSE = MIT
