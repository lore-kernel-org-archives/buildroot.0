From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-adobe-utopia-75dpi to
	1.0.2
Message-ID: <20100308133703.37395776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d0e48296aa781a0d6dd2bc5c37c22f063ea1481b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xfont_font-adobe-utopia-75dpi/Config.in  |    2 +-
 .../xfont_font-adobe-utopia-75dpi.mk               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
index baebefa..21ac46b 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
 	bool "font-adobe-utopia-75dpi"
 	help
-	  font-adobe-utopia-75dpi 1.0.1
+	  font-adobe-utopia-75dpi 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 774e2e3..412eb99 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.1
+XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_75DPI_AUTORECONF = NO
-- 
1.6.3.3
