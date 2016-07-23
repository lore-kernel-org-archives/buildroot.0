From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jul 2016 17:17:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.70
Message-ID: <1469287037-15165-1-git-send-email-bernd.kuhls@t-online.de>
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
index 3cfa34e..c205780 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-July/002700.html
-sha256	09510cbc75adba7e84fd3ec86586fd352a787fd534a63377de9e19ff85280b33	libdrm-2.4.69.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-July/113899.html
+sha256	b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b	libdrm-2.4.70.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e62f813..03bc7db 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.69
+LIBDRM_VERSION = 2.4.70
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.8.1
