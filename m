From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Dec 2016 20:22:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.26
Message-ID: <20161210192235.2235-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index cc4bde2..d2c377d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.25/
-sha1 fb471b7732d886b5adf10b4d689a90c88f005aa5 libpng-1.6.25.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.26/
+sha1 7a50569b26d57db9810409a59f1b87f8a8e387a3 libpng-1.6.26.tar.xz
 # Locally computed:
-sha256 09fe8d8341e8bfcfb3263100d9ac7ea2155b28dd8535f179111c1672ac8d8811  libpng-1.6.25.tar.xz
+sha256 266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9  libpng-1.6.26.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c577cd5..abb4928 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.25
+LIBPNG_VERSION = 1.6.26
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.10.2
