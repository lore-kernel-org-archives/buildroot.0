From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-micro-misc to 1.0.1
Message-ID: <20100308133710.66D35776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a025d07cb511fe4d2bf45ba7b950dfff689bf22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-micro-misc/Config.in      |    2 +-
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-micro-misc/Config.in b/package/x11r7/xfont_font-micro-misc/Config.in
index 056079d..987bf12 100644
--- a/package/x11r7/xfont_font-micro-misc/Config.in
+++ b/package/x11r7/xfont_font-micro-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
 	bool "font-micro-misc"
 	help
-	  font-micro-misc 1.0.0
+	  font-micro-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index a4ba9c3..c2efb87 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MICRO_MISC_VERSION = 1.0.0
+XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
 XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
 XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MICRO_MISC_AUTORECONF = NO
-- 
1.6.3.3
