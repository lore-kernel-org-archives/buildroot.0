From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  9 Sep 2019 20:06:05 +0300
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.32.0
Message-ID: <20190909170605.22147-1-asafka7@gmail.com>
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
index 126caa244a..d13a476264 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab041ea5d1965a33d4e03ea87718b8922ba4e54abb46c71cf9e040edef2556c0  libuv-1.31.0.tar.gz
+sha256  c9818f38eee79d4e56f3ae55320d207ab183c5d4aff0fb148b5d6f5702f371cd  libuv-1.32.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index d40ed2f01a..5cf09c8f49 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.31.0
+LIBUV_VERSION = 1.32.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.20.1
