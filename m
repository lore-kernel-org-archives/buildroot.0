From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-arabic-misc to 1.0.1
Message-ID: <20100308133704.58AFF776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b37b32e034dfe09979969d89d98b979a4ebffd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-arabic-misc/Config.in     |    2 +-
 .../xfont_font-arabic-misc.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-arabic-misc/Config.in b/package/x11r7/xfont_font-arabic-misc/Config.in
index 92f868e..1ef43e3 100644
--- a/package/x11r7/xfont_font-arabic-misc/Config.in
+++ b/package/x11r7/xfont_font-arabic-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
 	bool "font-arabic-misc"
 	help
-	  font-arabic-misc 1.0.0
+	  font-arabic-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 8564b53..0e2aeb6 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ARABIC_MISC_VERSION = 1.0.0
+XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
 XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
 XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ARABIC_MISC_AUTORECONF = NO
-- 
1.6.3.3
