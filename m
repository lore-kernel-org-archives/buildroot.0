From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 17 Aug 2019 14:55:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libuv: bump to version 1.31.0
Message-ID: <1566046523-2562-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index d7f4437..126caa2 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d85566c2c4eae7d8e2c2d27d40e728fea29f9086e98e795c5cdce1a790f43de5  libuv-1.30.1.tar.gz
+sha256  ab041ea5d1965a33d4e03ea87718b8922ba4e54abb46c71cf9e040edef2556c0  libuv-1.31.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 0825d7e..d40ed2f 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.30.1
+LIBUV_VERSION = 1.31.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.7.4
