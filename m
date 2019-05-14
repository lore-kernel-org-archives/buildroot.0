From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 14 May 2019 14:41:08 +0300
Subject: [Buildroot] [PATCH 2/5] package/wpebackend-fdo: bump to version
 1.2.0
In-Reply-To: <20190514114111.20424-1-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
Message-ID: <20190514114111.20424-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPE WebKit 2.24.x requires WPEBackend-fdo 1.2.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 6e6f9f0e3f..4d89d1e16f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.1.tar.xz.sums
-md5 2ee81a4212c18110a06a0c51c12e0d2e wpebackend-fdo-1.0.1.tar.xz
-sha1 cdc6ac95e302a2358204b766936a9bf8ef4f26f2 wpebackend-fdo-1.0.1.tar.xz
-sha256 15b8b1febea5d9c271e95c35b3c1e13f870712a54bc5f689cfdbb96e2f070fc8 wpebackend-fdo-1.0.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums
+md5 74e1b2fc2bc19933b17ff4f8435f67cd wpebackend-fdo-1.2.0.tar.xz
+sha1 60559697512fd483c1d918b708a3d1d130b74a0a wpebackend-fdo-1.2.0.tar.xz
+sha256 b1bb261273772af8f7d96d94989fc2ed0445ec06c7eb21f47a1b94e52422ddd5 wpebackend-fdo-1.2.0.tar.xz
 
 # Hashes for license files:
 sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 5842861bac..15530ec45f 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.0.1
+WPEBACKEND_FDO_VERSION = 1.2.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.21.0
