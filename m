From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 12:22:59 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.21
Message-ID: <1453303379-28559-1-git-send-email-gustavo@zacarias.com.ar>
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
index 264dd45..3b2db43 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.20/
-md5	3968acb7c66ef81a9dab867f35d0eb4b	libpng-1.6.20.tar.xz
-sha1	c4f02051e0b86613076ce390fd15824f3506a148	libpng-1.6.20.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.21/
+md5	3bacb4728f6694a64ad9052769d6a4ce	libpng-1.6.21.tar.xz
+sha1	978b2f4e007eda56032001493ddb97d20f0ab291	libpng-1.6.21.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 36ccf83..7ce4a3a 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.20
+LIBPNG_VERSION = 1.6.21
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.4.10
