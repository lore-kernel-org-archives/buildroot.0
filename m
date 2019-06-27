From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 27 Jun 2019 21:58:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.30.0
Message-ID: <20190627185820.464-1-asafka7@gmail.com>
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
index 373c156ca5..ff0b9998ec 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bdde1140087ce97080ea323c3598553ece00a24ae63ac568be78bef3e97f3e25  libuv-1.29.1.tar.gz
+sha256  44c8fdadf3b3f393006a4ac4ba144020673a3f9cd72bed1fbb2c366ebcf0d199  libuv-1.30.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 17db3480e8..f17b5a8bf2 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.29.1
+LIBUV_VERSION = 1.30.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.20.1
