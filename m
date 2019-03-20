From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 20 Mar 2019 20:44:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.27.0
Message-ID: <20190320184446.20176-1-asafka7@gmail.com>
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
index e0a217c625..be8a81996d 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e414cf74615b7dae768f0f5667092f1d4975f5067c087bcbe0641e241ebe4693  libuv-v1.26.0.tar.gz
+sha256  4afcdc84cd315b77c8e532e7b3fde43d536af0e2e835eafbd0e75518ed26dbed  libuv-v1.27.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 4ab7f754ff..c6c37618eb 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.26.0
+LIBUV_VERSION = v1.27.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.19.1
