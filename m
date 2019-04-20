From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:06:32 +0200
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.28.0
Message-ID: <20190420200202.6F23981544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2631c4427475cbf8a008727d5b2ef8345fd7ad5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index be8a81996d..7f51dfc923 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4afcdc84cd315b77c8e532e7b3fde43d536af0e2e835eafbd0e75518ed26dbed  libuv-v1.27.0.tar.gz
+sha256  9ab338062e5b73bd4a05b7fcb77a0745c925c0be9118e0946434946a262cdad5  libuv-v1.28.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index c6c37618eb..00b13f26bc 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.27.0
+LIBUV_VERSION = v1.28.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
