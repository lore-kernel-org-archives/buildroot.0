From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-misc-ethiopic to 1.0.1
Message-ID: <20100308133710.E9103776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=064d0f69b92af4cf8bcd91fae59a68cc8ea9911c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-misc-ethiopic/Config.in   |    2 +-
 .../xfont_font-misc-ethiopic.mk                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-ethiopic/Config.in b/package/x11r7/xfont_font-misc-ethiopic/Config.in
index 7784a15..6fb564f 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/Config.in
+++ b/package/x11r7/xfont_font-misc-ethiopic/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
 	bool "font-misc-ethiopic"
 	help
-	  font-misc-ethiopic 1.0.0
+	  font-misc-ethiopic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index da75304..494fbfe 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.0
+XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.1
 XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
 XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_ETHIOPIC_AUTORECONF = NO
-- 
1.6.3.3
