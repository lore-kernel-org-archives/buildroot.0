From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 18 Mar 2014 17:40:11 +0100
Subject: [Buildroot] [PATCH] feh: bump to 2.10
Message-ID: <1395160811-30870-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/feh/feh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 8be6517..ddd4895 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.9.3
+FEH_VERSION = 2.10
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
-- 
1.8.1.2
