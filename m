From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-misc-misc to 1.1.0
Message-ID: <20100308133711.91190776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=04e6be89f7916b318d7e5a496d62a6731f8eac62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-misc-misc/Config.in       |    2 +-
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-misc/Config.in b/package/x11r7/xfont_font-misc-misc/Config.in
index d4bb9e5..dd0e359 100644
--- a/package/x11r7/xfont_font-misc-misc/Config.in
+++ b/package/x11r7/xfont_font-misc-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MISC
 	bool "font-misc-misc"
 	help
-	  font-misc-misc 1.0.0
+	  font-misc-misc 1.1.0
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 3929915..de9ca24 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_MISC_VERSION = 1.0.0
+XFONT_FONT_MISC_MISC_VERSION = 1.1.0
 XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
 XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_AUTORECONF = NO
-- 
1.6.3.3
