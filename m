From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Oct 2017 19:00:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.87
Message-ID: <20171031180022.12813-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 7 +++++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 109be315d0..735164cf8f 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,5 @@
-# Locally computed
-sha256 64e4cd87eaee38ae60b2984ef02b66159b9bdd33030040db2a04339cf15f6173  libdrm-2.4.85.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-October/156384.html
+md5 b4f9063838559d08649d45fec2d1184a  libdrm-2.4.87.tar.bz2
+sha1 26b976c8901061399b8b934854b960f5b0761f36  libdrm-2.4.87.tar.bz2
+sha256 4c1c5293bdbfa248e029d3e6446767e17a3208387a719ec9da2d20c19849ed48  libdrm-2.4.87.tar.bz2
+sha512 9ce259d38eaffbcaf82a6975ffa513307da6750bcc31a53cade5717f854151b0e7b6d4ce25c0b518cab5a542c544d5984329f216dc4cdc9369b4adae19a68e48  libdrm-2.4.87.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e93864e556..71a30035e3 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.85
+LIBDRM_VERSION = 2.4.87
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
