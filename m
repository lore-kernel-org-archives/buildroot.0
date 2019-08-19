From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 19 Aug 2019 15:10:58 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.2.2
Message-ID: <20190819121058.26798-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bugfix release which solves an underlinking issue, which would
prevent building in some situations (for example, when --no-undefined is
passed to the linker). Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.2.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 14c6715358..94e10ecba1 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.1.tar.xz.sums
-md5 fc76ac572ed03da8237d1e3e3991d0c3 wpebackend-fdo-1.2.1.tar.xz
-sha1 8c994a25839b9df214c148c8892ee2c6f88ebbde wpebackend-fdo-1.2.1.tar.xz
-sha256 6ef0852ecb9513a6789f8bbb9533083fcb165bb2d762eeb6d31e0b58c708cca0 wpebackend-fdo-1.2.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.2.tar.xz.sums
+md5 59b5fd6a3b64fe473458e16913ff9256 wpebackend-fdo-1.2.2.tar.xz
+sha1 d525044256dc7ee13fd64bc10d3e24e3b980125e wpebackend-fdo-1.2.2.tar.xz
+sha256 a2a50631eff7ec7ad1f787ab7ea9a524148588edbb42fff614ee404e1bcc126d wpebackend-fdo-1.2.2.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index c7e1b0abcf..6bf18431e7 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.2.1
+WPEBACKEND_FDO_VERSION = 1.2.2
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.23.0
