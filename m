From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 23 Mar 2021 00:28:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpebackend-fdo: bump to version
 1.8.2
In-Reply-To: <20210322222837.1382502-1-aperez@igalia.com>
References: <20210322222837.1382502-1-aperez@igalia.com>
Message-ID: <20210322222837.1382502-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This minor release fixes an issue with its public API headers which
can cause third party packages (mainly wpewebkit) to show build errors.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.8.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index a7b419fc32..89d58051c7 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.1.tar.xz.sums
-md5  e7083e9fd325f289b23253b770d08d2e  wpebackend-fdo-1.8.1.tar.xz
-sha1  08472f1bcff6100ba963bdbe7347487253006ca0  wpebackend-fdo-1.8.1.tar.xz
-sha256  8adb4475be949ae4092370de6a37d7b9e1d3704cf4674867312e87de2ff0d880  wpebackend-fdo-1.8.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.2.tar.xz.sums
+md5  93ca185b5c0f539abbf7ab32cfdc96b2  wpebackend-fdo-1.8.2.tar.xz
+sha1  715a1a1e0cfd85898a1f686ec4c5b79a1e8cfb9c  wpebackend-fdo-1.8.2.tar.xz
+sha256  98c291071128326a72918d670a46ef63268c43267928560ac3b84b6aebb2d78d  wpebackend-fdo-1.8.2.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index fd313132b3..193b4cf7ed 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.8.1
+WPEBACKEND_FDO_VERSION = 1.8.2
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.31.0
