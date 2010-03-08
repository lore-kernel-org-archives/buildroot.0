From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-adobe-utopia-type1 to
	1.0.2
Message-ID: <20100308133703.7328F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=93963b2633d2decf4b56fc8b47a7ea0247d57ab6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xfont_font-adobe-utopia-type1/Config.in  |    2 +-
 .../xfont_font-adobe-utopia-type1.mk               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
index 0e82f7b..7cd11ff 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
 	bool "font-adobe-utopia-type1"
 	help
-	  font-adobe-utopia-type1 1.0.1
+	  font-adobe-utopia-type1 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 16ed319..daa5f37 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.1
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_AUTORECONF = NO
-- 
1.6.3.3
