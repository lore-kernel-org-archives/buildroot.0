From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Feb 2011 10:26:24 +0100
Subject: [Buildroot] [git commit master 1/1] imagemagick: bump version
Message-ID: <20110211093539.873128F4A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e9a7bf38b3526d385e65074b5d9527f0a1427db2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.6.7-4 version is no longer available upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2166c34..97c0041 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 IMAGEMAGICK_MAJOR = 6.6.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-4
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_INSTALL_STAGING = YES
-- 
1.7.3.4
