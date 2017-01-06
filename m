From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Jan 2017 11:28:47 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.28
Message-ID: <20170106142847.1256-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 237a54f..e5bd6ba 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.27/
-sha1 af5d742f5d0a6492133aed7790bb43e8854cca64 libpng-1.6.27.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.28/
+sha1 ff4dceadb15e2c929ad26283118d56f66f4a6cff libpng-1.6.28.tar.xz
 # Locally computed:
-sha256 fca2ffd97336356cdab9bfa8936b9d6dfd580a70205e5dfead3ac42cb054b57b  libpng-1.6.27.tar.xz
+sha256 d8d3ec9de6b5db740fefac702c37ffcf96ae46cb17c18c1544635a3852f78f7a  libpng-1.6.28.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 4b3a4ad..c562965 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.27
+LIBPNG_VERSION = 1.6.28
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.10.2
