From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 23 Jun 2018 08:49:56 +0300
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.21.0
Message-ID: <20180623054956.24077-1-asafka7@gmail.com>
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
index e877e0a1e9..612f45b6ad 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43a388687194a15d5f3cc1980d53c405020a3586254c620e5f3c4d241bb9da05  libuv-v1.20.3.tar.gz
+sha256  c6f53e4a75d2601db8efe0e837839969de7667d36569110429a0bc8f8229bf59  libuv-v1.21.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 83b39ac7a2..591eaeb7c4 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.20.3
+LIBUV_VERSION = v1.21.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.17.1
