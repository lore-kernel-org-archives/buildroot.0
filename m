From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 20 Apr 2018 17:16:50 +0300
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.20.1
Message-ID: <20180420141650.4191-1-asafka7@gmail.com>
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
index c14b2d4971..df021c567b 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d36f18f556cc288813032a168fd9181b45d9e66e3e18e54a8dbdfd8ea3c3dba  libuv-v1.20.0.tar.gz
+sha256  abc9106789c15a1c8009ab3d114a5b44bd6e240b183240f47e28aa542eea07b4  libuv-v1.20.1.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 54ce6bdaa6..6d1a4acc01 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.20.0
+LIBUV_VERSION = v1.20.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.17.0
