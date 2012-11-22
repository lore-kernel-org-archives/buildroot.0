From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:17 +0100
Subject: [Buildroot] [PATCH 27/33] imagemagick: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-28-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/imagemagick/imagemagick.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 365a073..725e529 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -11,6 +11,9 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
 IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
+IMAGEMAGICK_LICENSE = Apache-v2
+IMAGEMAGICK_LICENSE_FILES = LICENSE
+
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_AUTORECONF = YES
 
-- 
1.8.0
