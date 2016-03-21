From: Julian Scheel <julian@jusst.de>
Date: Mon, 21 Mar 2016 13:34:56 +0100
Subject: [Buildroot] [PATCH] dfu-util: Bump version to 0.9
Message-ID: <1458563696-3503-1-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/dfu-util/dfu-util.hash | 7 +++++--
 package/dfu-util/dfu-util.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
index 0901717..bf618d1 100644
--- a/package/dfu-util/dfu-util.hash
+++ b/package/dfu-util/dfu-util.hash
@@ -1,2 +1,5 @@
-# From http://dfu-util.sourceforge.net/releases/dfu-util-0.8.tar.gz.md5
-md5	fc6daf6b0ee57d7e40ffa3e8111023d1	dfu-util-0.8.tar.gz
+# From http://dfu-util.sourceforge.net/releases/dfu-util-0.9.tar.gz.md5
+md5	233bb1e08ef4b405062445d84e28fde6	dfu-util-0.9.tar.gz
+
+# Locally computed
+sha256	36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833	dfu-util-0.9.tar.gz
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 3e612db..079f875 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DFU_UTIL_VERSION = 0.8
+DFU_UTIL_VERSION = 0.9
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPLv2+
 DFU_UTIL_LICENSE_FILES = COPYING
-- 
2.7.3
