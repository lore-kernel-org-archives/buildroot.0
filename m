From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 10 Feb 2019 19:55:45 +0200
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.26.0
Message-ID: <20190210175545.9635-1-asafka7@gmail.com>
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
index 8f11743b5a..e0a217c625 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce3036d444c3fb4f9a9e2994bec1f4fa07872b01456998b422ce918fdc55c254  libuv-v1.25.0.tar.gz
+sha256  e414cf74615b7dae768f0f5667092f1d4975f5067c087bcbe0641e241ebe4693  libuv-v1.26.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index fec6659ed9..4ab7f754ff 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.25.0
+LIBUV_VERSION = v1.26.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.19.1
