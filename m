From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 14:39:43 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.17
Message-ID: <1433439583-32343-1-git-send-email-gustavo@zacarias.com.ar>
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
index d0027c7..dd4af06 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.16/
-md5	23b7286b5d4a86de950fd2ffc5cac742	libpng-1.6.16.tar.xz
-sha1	31855a8438ae795d249574b0da15b34eb0922e13	libpng-1.6.16.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.17/
+md5	430a9b76b78533235cd4b9b26ce75c7e	libpng-1.6.17.tar.xz
+sha1	6394f3c0847c3b9ea69f4f972dddae3786592050	libpng-1.6.17.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2f53a95..08d8196 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.16
+LIBPNG_VERSION = 1.6.17
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.3.6
