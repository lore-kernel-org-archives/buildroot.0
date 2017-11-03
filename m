From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Nov 2017 18:15:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.88
Message-ID: <20171103171506.14472-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 735164cf8f..87fdc893cb 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-October/156384.html
-md5 b4f9063838559d08649d45fec2d1184a  libdrm-2.4.87.tar.bz2
-sha1 26b976c8901061399b8b934854b960f5b0761f36  libdrm-2.4.87.tar.bz2
-sha256 4c1c5293bdbfa248e029d3e6446767e17a3208387a719ec9da2d20c19849ed48  libdrm-2.4.87.tar.bz2
-sha512 9ce259d38eaffbcaf82a6975ffa513307da6750bcc31a53cade5717f854151b0e7b6d4ce25c0b518cab5a542c544d5984329f216dc4cdc9369b4adae19a68e48  libdrm-2.4.87.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-November/156682.html
+md5 fe4d5c77f1468ee73d0bbb30d76945d7  libdrm-2.4.88.tar.bz2
+sha1 9cac721d33eb1e65a89a764cb71a7a63ceb6d7c1  libdrm-2.4.88.tar.bz2
+sha256 b5e55dbac2124e742e639f5b8553e8b7395863bf73dab4f77e99fe2fc25572b5  libdrm-2.4.88.tar.bz2
+sha512 0d9d4bcc0d9be1fb6b1ca075339b22b0f927288a4c02bbcbf95406b5c095051890f3d2e0d32e529ef9b6952ce1250afd1e0765ad3188c2bac924dda8c33afabb  libdrm-2.4.88.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 71a30035e3..3d7b67122b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.87
+LIBDRM_VERSION = 2.4.88
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
