From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 11:42:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.74
Message-ID: <20161203104208.26813-1-bernd.kuhls@t-online.de>
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
index 3131705..96bd985 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-November/123704.html
-sha256 96bfd39242fe168017d95f22e141645a35591f5902a7d98c2fa4ca8c31df5e4d  libdrm-2.4.73.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2016-November/125379.html
+sha256 d80dd5a76c401f4c8756dcccd999c63d7e0a3bad258d96a829055cfd86ef840b  libdrm-2.4.74.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b4e1aad..511f803 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.73
+LIBDRM_VERSION = 2.4.74
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.10.2
