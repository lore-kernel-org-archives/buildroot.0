From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Feb 2011 22:44:21 +0100
Subject: [Buildroot] [git commit master 1/1] imagemagick: bump to version
	6.6.7-4
Message-ID: <20110202214453.7DDB38F34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b9defe7f0e138c8613e70056085ff2320fefae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
