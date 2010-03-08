From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-sony-misc to 1.0.1
Message-ID: <20100308133712.942D1776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=815560045203dbcaee165912792f51ec1ca19c6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-sony-misc/Config.in       |    2 +-
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-sony-misc/Config.in b/package/x11r7/xfont_font-sony-misc/Config.in
index 76bdd41..2a831ab 100644
--- a/package/x11r7/xfont_font-sony-misc/Config.in
+++ b/package/x11r7/xfont_font-sony-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SONY_MISC
 	bool "font-sony-misc"
 	help
-	  font-sony-misc 1.0.0
+	  font-sony-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 669ce46..7f825c8 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_SONY_MISC_VERSION = 1.0.0
+XFONT_FONT_SONY_MISC_VERSION = 1.0.1
 XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
 XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SONY_MISC_AUTORECONF = NO
-- 
1.6.3.3
