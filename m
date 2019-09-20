From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 21 Sep 2019 00:38:24 +0300
Subject: [Buildroot] [PATCH 2/4] package/wpebackend-fdo: bump to version
 1.4.0
In-Reply-To: <20190920213826.2531495-1-aperez@igalia.com>
References: <20190920213826.2531495-1-aperez@igalia.com>
Message-ID: <20190920213826.2531495-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPE WebKit 2.26.0 requires libwpe 1.4.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 94e10ecba1..85e02e22a8 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.2.tar.xz.sums
-md5 59b5fd6a3b64fe473458e16913ff9256 wpebackend-fdo-1.2.2.tar.xz
-sha1 d525044256dc7ee13fd64bc10d3e24e3b980125e wpebackend-fdo-1.2.2.tar.xz
-sha256 a2a50631eff7ec7ad1f787ab7ea9a524148588edbb42fff614ee404e1bcc126d wpebackend-fdo-1.2.2.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.4.0.tar.xz.sums
+md5 63553c3f43593c2a8c587c32e88fdf3c wpebackend-fdo-1.4.0.tar.xz
+sha1 a426d9a778ab52be2f4dd9cc7d324b43abac2f80 wpebackend-fdo-1.4.0.tar.xz
+sha256 a919ca4a5bc445f9419a5b7f3781cfc98e5abcf5d7259eb1869f5ab20fd18baf wpebackend-fdo-1.4.0.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 6bf18431e7..1f3fc705cc 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.2.2
+WPEBACKEND_FDO_VERSION = 1.4.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.23.0
