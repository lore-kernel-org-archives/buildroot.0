From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 21 Sep 2011 12:24:10 +0200
Subject: [Buildroot] [PATCH] libiconv: bump to 1.14
Message-ID: <4E79BB4A.1040608@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libiconv/libiconv.mk |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Index: b/package/libiconv/libiconv.mk
===================================================================
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -3,12 +3,10 @@
 # libiconv
 #
 #############################################################
-LIBICONV_VERSION = 1.12
+LIBICONV_VERSION = 1.14
 LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
-LIBICONV_AUTORECONF = NO
 LIBICONV_INSTALL_STAGING = YES
-LIBICONV_INSTALL_TARGET = YES
 
 # Remove not used preloadable libiconv.so
 define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
