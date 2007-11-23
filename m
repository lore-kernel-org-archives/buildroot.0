From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Nov 2007 23:40:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
Message-ID: <20071123074016.735F630048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-22 23:40:15 -0800 (Thu, 22 Nov 2007)
New Revision: 20487

Log:
Bump ImageMagick to v 6.3.7

Modified:
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-11-23 07:26:15 UTC (rev 20486)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-11-23 07:40:15 UTC (rev 20487)
@@ -3,7 +3,7 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_VERSION:=6.3.5
+IMAGEMAGICK_VERSION:=6.3.7
 IMAGEMAGICK_SOURCE:=ImageMagick.tar.bz2
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
