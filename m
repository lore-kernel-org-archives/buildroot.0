From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  3 Oct 2016 23:19:15 -0300
Subject: [Buildroot] [PATCH] package/libdrm: bump version to 2.4.71
Message-ID: <1475547555-25769-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/libdrm/libdrm.hash | 4 ++--
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index c205780..bda054e 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-July/113899.html
-sha256	b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b	libdrm-2.4.70.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-October/119998.html
+sha256	c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8	libdrm-2.4.71.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index d8d7744..d06f3ec 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.70
+LIBDRM_VERSION = 2.4.71
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.7.4
