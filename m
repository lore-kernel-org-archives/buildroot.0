From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Feb 2015 09:40:36 +0100
Subject: [Buildroot] [PATCH master] imagemagick: use official download site
Message-ID: <1424162436-12220-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't use anymore the alternate download site beacause it does not
conatins anymore older versions, instead use the official download site
because now it contains even the older versions.

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
---
 package/imagemagick/imagemagick.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f78fcd3..ab2b792 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -6,10 +6,7 @@
 
 IMAGEMAGICK_VERSION = 6.9.0-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
-# The official ImageMagick site only keeps the latest versions
-# available, which is annoying. Use an alternate site that keeps all
-# older versions.
-IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick
+IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
 
-- 
2.3.0
