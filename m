From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Aug 2012 16:15:18 -0300
Subject: [Buildroot] [PATCH] imagemagick: security bump to version 6.7.8-8
Message-ID: <1344280518-5293-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-3437, CVE-2012-3437 and CVE-2012-3438.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ede129a..6d34ad3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-IMAGEMAGICK_MAJOR = 6.7.6
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-9
+IMAGEMAGICK_MAJOR = 6.7.8
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.8.6
