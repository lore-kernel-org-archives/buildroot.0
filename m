From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 19 Aug 2019 14:58:05 +0300
Subject: [Buildroot] [PATCH 1/1] package/libwpe: bump to version 1.2.1
Message-ID: <20190819115805.24962-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a bugfix release of libwpe, which fixes an issue with memory
allocation for the pasteboard, adds some missing Unicode-to-KeySym
conversions, and fixes a build issue. Full release notes:

  https://wpewebkit.org/release/libwpe-1.2.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index bd36016603..c46e205dcf 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.2.0.tar.xz.sums
-md5 060876c6a32ef1ae519cb9542d0ede06 libwpe-1.2.0.tar.xz
-sha1 5dd34eba8cc7625d2b1c679c509492941092d137 libwpe-1.2.0.tar.xz
-sha256 f28035e7a8991fbb1a0e762f1b3d0e3cb57513a3164c75c7dc3eb0c11d9149fc libwpe-1.2.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.2.1.tar.xz.sums
+md5 9f26865f06ecf933ddbbf067a7be735f libwpe-1.2.1.tar.xz
+sha1 d3f6211a2acafe1bd1f41e826c8efae35335fc92 libwpe-1.2.1.tar.xz
+sha256 00e103c6fa226b0d979c29d14c9e8168c4bec7b0b5108f3705a037cda5609d7d libwpe-1.2.1.tar.xz
 
 # Hashes for license files:
 sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index fca974aecd..171bd75551 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.2.0
+LIBWPE_VERSION = 1.2.1
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.23.0
