From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 19 Mar 2015 22:59:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.60
Message-ID: <1426802348-18962-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash |    4 ++--
 package/libdrm/libdrm.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index c893e76..42675bb 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-January/075921.html
-sha256	68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b	libdrm-2.4.59.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-March/079617.html
+sha256	99575fc6c8e31f59193f5320fd4db7a5478e2641b5266147caab9aa875b59889	libdrm-2.4.60.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 737a33b..a804ee8 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.59
+LIBDRM_VERSION = 2.4.60
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
1.7.10.4
