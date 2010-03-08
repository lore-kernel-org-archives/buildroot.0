From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-misc-meltho to 1.0.1
Message-ID: <20100308133711.5136B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec11946c575ed856a49200b61f7d08371e7cbf96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-misc-meltho/Config.in     |    2 +-
 .../xfont_font-misc-meltho.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-meltho/Config.in b/package/x11r7/xfont_font-misc-meltho/Config.in
index 8445731..d416f85 100644
--- a/package/x11r7/xfont_font-misc-meltho/Config.in
+++ b/package/x11r7/xfont_font-misc-meltho/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
 	bool "font-misc-meltho"
 	help
-	  font-misc-meltho 1.0.0
+	  font-misc-meltho 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 2dfd007..67c5ecd 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_MELTHO_VERSION = 1.0.0
+XFONT_FONT_MISC_MELTHO_VERSION = 1.0.1
 XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
 XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MELTHO_AUTORECONF = NO
-- 
1.6.3.3
