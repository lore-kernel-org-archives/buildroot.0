From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:20:00 +0100
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.8.1
Message-ID: <20210314215624.EB88287821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=252e7afb61029acc287a388a55d03bda491742e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bugfix release solves a couple of leaks and sporadic crashes.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.8.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 2f8321833c..a7b419fc32 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.0.tar.xz.sums
-md5  6df96f80ff34c02d56f32a7a153a62c0  wpebackend-fdo-1.8.0.tar.xz
-sha1  48dd8d5d525e0c89b8b7068fe51c439921804240  wpebackend-fdo-1.8.0.tar.xz
-sha256  9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253  wpebackend-fdo-1.8.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.1.tar.xz.sums
+md5  e7083e9fd325f289b23253b770d08d2e  wpebackend-fdo-1.8.1.tar.xz
+sha1  08472f1bcff6100ba963bdbe7347487253006ca0  wpebackend-fdo-1.8.1.tar.xz
+sha256  8adb4475be949ae4092370de6a37d7b9e1d3704cf4674867312e87de2ff0d880  wpebackend-fdo-1.8.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index dc0c9b6740..fd313132b3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.8.0
+WPEBACKEND_FDO_VERSION = 1.8.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
