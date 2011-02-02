From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Feb 2011 09:22:21 -0300
Subject: [Buildroot] [PATCH 2/5] imagemagick: bump to version 6.6.7-4
In-Reply-To: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296649344-12456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296649344-12456-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index aecf7ae..2166c34 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -3,11 +3,11 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_MAJOR = 6.6.4
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
+
+IMAGEMAGICK_MAJOR = 6.6.7
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
-IMAGEMAGICK_LIBTOOL_PATCH = NO
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
-- 
1.7.3.4
