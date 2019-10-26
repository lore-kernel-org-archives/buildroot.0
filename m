From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 20:34:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.31.1
Message-ID: <20191026183432.3794-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/busybox/busybox.hash | 5 +++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 2b346e685d..e5b05ae731 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,4 @@
-# From https://busybox.net/downloads/busybox-1.31.0.tar.bz2.sha256
-sha256 0e4925392fd9f3743cc517e031b68b012b24a63b0cf6c1ff03cce7bb3846cc99  busybox-1.31.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.31.1.tar.bz2.sha256
+sha256 d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998  busybox-1.31.1.tar.bz2
+# Locally computed
 sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a154584592..680d3bc17f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.31.0
+BUSYBOX_VERSION = 1.31.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
-- 
2.20.1
