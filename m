From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Jul 2014 07:22:24 -0300
Subject: [Buildroot] [PATCH 2/2] imagemagick: bump to version 6.8.9-5
In-Reply-To: <1404210144-5425-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404210144-5425-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404210144-5425-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/imagemagick/imagemagick.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6d6d5de..b713f98 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.8.9-3
+IMAGEMAGICK_VERSION = 6.8.9-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.8.5.5
