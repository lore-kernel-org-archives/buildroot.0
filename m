From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jun 2015 18:14:16 +0200
Subject: [Buildroot] [PATCH 1/3] package/libdrm: bump version to 2.4.61
Message-ID: <1433693658-20065-1-git-send-email-bernd.kuhls@t-online.de>
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
index 42675bb..99889ea 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/dri-devel/2015-March/079617.html
-sha256	99575fc6c8e31f59193f5320fd4db7a5478e2641b5266147caab9aa875b59889	libdrm-2.4.60.tar.bz2
+# From http://lists.freedesktop.org/archives/dri-devel/2015-May/082348.html
+sha256	8b549092c8961a393a7e1d9a1bccddcea8e2af67c0d7d7c67babb9fc3b47699c	libdrm-2.4.61.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a804ee8..3c3de1d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.60
+LIBDRM_VERSION = 2.4.61
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
1.7.10.4
