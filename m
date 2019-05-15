From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 15 May 2019 21:18:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.29.0
Message-ID: <20190515181831.26670-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 7f51dfc923..b237bd81dd 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ab338062e5b73bd4a05b7fcb77a0745c925c0be9118e0946434946a262cdad5  libuv-v1.28.0.tar.gz
+sha256  ca62158fd35dfc06e37400f5ae5d0f18dde1ffc4c140738fff6f95b036a8b6f1  libuv-v1.29.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 00b13f26bc..ef6fc1af12 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.28.0
+LIBUV_VERSION = v1.29.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.20.1
