From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-sun-misc to 1.0.1
Message-ID: <20100308133712.CE81F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94dc634d66fd9c9d2e55ed07b5d51314f82e8250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-sun-misc/Config.in        |    2 +-
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-sun-misc/Config.in b/package/x11r7/xfont_font-sun-misc/Config.in
index 86337d3..ce41c62 100644
--- a/package/x11r7/xfont_font-sun-misc/Config.in
+++ b/package/x11r7/xfont_font-sun-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SUN_MISC
 	bool "font-sun-misc"
 	help
-	  font-sun-misc 1.0.0
+	  font-sun-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 15acf4e..f06ecf7 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_SUN_MISC_VERSION = 1.0.0
+XFONT_FONT_SUN_MISC_VERSION = 1.0.1
 XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
 XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SUN_MISC_AUTORECONF = NO
-- 
1.6.3.3
