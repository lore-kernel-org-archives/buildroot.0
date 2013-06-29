From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Jun 2013 08:06:46 -0300
Subject: [Buildroot] [PATCH 2/2] imagemagick: bump to version 6.8.6-2
In-Reply-To: <1372504006-627-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372504006-627-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372504006-627-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e2259e6..12b9f4b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.7.8
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
+IMAGEMAGICK_MAJOR = 6.8.6
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.8.1.5
