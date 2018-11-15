From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 15 Nov 2018 20:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.24.0
Message-ID: <20181115182346.5743-1-asafka7@gmail.com>
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
index 0a039480ad..c19aba9c9a 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  30af979c4f4b8d1b895ae6d115f7400c751542ccb9e656350fc89fda08d4eabd  libuv-v1.23.2.tar.gz
+sha256  55587c525196a7a550fa7e5eb61794c377ec23b44adb435fdded86e8f7f31a16  libuv-v1.24.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index ff3903b568..ddf6eb8112 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.23.2
+LIBUV_VERSION = v1.24.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.19.1
