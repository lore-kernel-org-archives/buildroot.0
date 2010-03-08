From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-adobe-utopia-100dpi to
	1.0.2
Message-ID: <20100308133703.006C8776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=021d086b712c1bb18af18283c64fe3e37fea2e72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xfont_font-adobe-utopia-100dpi/Config.in |    2 +-
 .../xfont_font-adobe-utopia-100dpi.mk              |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
index ae336c4..e0b8b2a 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
 	bool "font-adobe-utopia-100dpi"
 	help
-	  font-adobe-utopia-100dpi 1.0.1
+	  font-adobe-utopia-100dpi 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 933f8f0..9bf704f 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.1
+XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_100DPI_AUTORECONF = NO
-- 
1.6.3.3
