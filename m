From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 16 Dec 2018 21:46:32 +0200
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.24.1
Message-ID: <20181216194632.4784-1-asafka7@gmail.com>
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
index c19aba9c9a..f4e9d53a86 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55587c525196a7a550fa7e5eb61794c377ec23b44adb435fdded86e8f7f31a16  libuv-v1.24.0.tar.gz
+sha256  0d026c8f68c4d7b7c59de8f485f262ac71c24e0f3a80d740a25d20edd2f2774e  libuv-v1.24.1.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index ddf6eb8112..40e6bd26d6 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.24.0
+LIBUV_VERSION = v1.24.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.19.1
