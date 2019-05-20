From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:25:35 +0200
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.2.0
Message-ID: <20190602201235.1F65381354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=969bad300d6a03dd10d389dcad26216712e284f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WPE WebKit 2.24.x requires libwpe 1.2.x, as indicated at:

  https://wpewebkit.org/release/schedule/#compatible-components

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 58dba92e6f..bd36016603 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.0.0.tar.xz.sums
-md5 b5ea32bd644811d5c6433cf1439763f7 libwpe-1.0.0.tar.xz
-sha1 6e51591c00a9a6128e19920807e6874794c723fd libwpe-1.0.0.tar.xz
-sha256 aff11612123f9ab85a8b9a4bcdfb3a7503eba0a0d2d96f2cdecd30e911091719 libwpe-1.0.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.2.0.tar.xz.sums
+md5 060876c6a32ef1ae519cb9542d0ede06 libwpe-1.2.0.tar.xz
+sha1 5dd34eba8cc7625d2b1c679c509492941092d137 libwpe-1.2.0.tar.xz
+sha256 f28035e7a8991fbb1a0e762f1b3d0e3cb57513a3164c75c7dc3eb0c11d9149fc libwpe-1.2.0.tar.xz
 
 # Hashes for license files:
 sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index aad1214e1d..fca974aecd 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.0.0
+LIBWPE_VERSION = 1.2.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
