From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Dec 2016 10:28:43 -0300
Subject: [Buildroot] [PATCH] libpng: security bump to version 1.6.27
Message-ID: <20161230132843.8991-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a NULL pointer dereference bug in png_set_text_2()
CVE not assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index d2c377d..237a54f 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.26/
-sha1 7a50569b26d57db9810409a59f1b87f8a8e387a3 libpng-1.6.26.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.27/
+sha1 af5d742f5d0a6492133aed7790bb43e8854cca64 libpng-1.6.27.tar.xz
 # Locally computed:
-sha256 266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9  libpng-1.6.26.tar.xz
+sha256 fca2ffd97336356cdab9bfa8936b9d6dfd580a70205e5dfead3ac42cb054b57b  libpng-1.6.27.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index abb4928..4b3a4ad 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.26
+LIBPNG_VERSION = 1.6.27
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.10.2
