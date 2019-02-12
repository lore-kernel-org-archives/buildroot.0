From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 12 Feb 2019 15:09:06 +0200
Subject: [Buildroot] [PATCH next 1/2] package/wpebackend-fdo: bump to
 version 1.0.1
Message-ID: <20190212130907.54658-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release fixes contains a small fix which allows calling the
backend initialization routine more than once. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.0.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 20c89d324c..6e6f9f0e3f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.0.tar.xz.sums
-md5 5318728afb3bf7417293af67ce427963 wpebackend-fdo-1.0.0.tar.xz
-sha1 7ee22bc1d585616f4ad2047d8be54ec396486211 wpebackend-fdo-1.0.0.tar.xz
-sha256 7a747f87a1ae46d30144369050e3ce348b58986d04e1a139ba75c198fa636729 wpebackend-fdo-1.0.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.1.tar.xz.sums
+md5 2ee81a4212c18110a06a0c51c12e0d2e wpebackend-fdo-1.0.1.tar.xz
+sha1 cdc6ac95e302a2358204b766936a9bf8ef4f26f2 wpebackend-fdo-1.0.1.tar.xz
+sha256 15b8b1febea5d9c271e95c35b3c1e13f870712a54bc5f689cfdbb96e2f070fc8 wpebackend-fdo-1.0.1.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 06c87cb9bf..5842861bac 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.0.0
+WPEBACKEND_FDO_VERSION = 1.0.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.20.1
