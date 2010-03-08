From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-cursor-misc to 1.0.1
Message-ID: <20100308133708.2009B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d0948be526e6dfee45aebcbd99efa2d4f9052d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-cursor-misc/Config.in     |    2 +-
 .../xfont_font-cursor-misc.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-cursor-misc/Config.in b/package/x11r7/xfont_font-cursor-misc/Config.in
index cfbb2a6..9b967e1 100644
--- a/package/x11r7/xfont_font-cursor-misc/Config.in
+++ b/package/x11r7/xfont_font-cursor-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	bool "font-cursor-misc"
 	help
-	  font-cursor-misc 1.0.0
+	  font-cursor-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index bdd36a3..86990b8 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_CURSOR_MISC_VERSION = 1.0.0
+XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
 XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
 XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_CURSOR_MISC_AUTORECONF = NO
-- 
1.6.3.3
