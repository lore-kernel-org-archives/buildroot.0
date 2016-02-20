From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 21:28:09 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.67
Message-ID: <1456000089-3939-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 948c7bf..8e3104c 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-December/097697.html
-sha256	79cb8e988749794edfb2d777b298d5292eff353bbbb71ed813589e61d2bc2d76	libdrm-2.4.66.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-February/100859.html
+sha256	ee5b71e1113be37544d0752681c12f040c01f782e2933df7d7bc21fd0d10cebe	libdrm-2.4.67.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 8d84beb..99a78d2 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.66
+LIBDRM_VERSION = 2.4.67
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.7.0
