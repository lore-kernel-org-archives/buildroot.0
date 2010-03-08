From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-bh-100dpi to 1.0.1
Message-ID: <20100308133704.BEDAD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=88164de020152c42ab5302f62a7b9c4f641c9598
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-bh-100dpi/Config.in       |    2 +-
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-bh-100dpi/Config.in b/package/x11r7/xfont_font-bh-100dpi/Config.in
index 5a524c5..b0d2809 100644
--- a/package/x11r7/xfont_font-bh-100dpi/Config.in
+++ b/package/x11r7/xfont_font-bh-100dpi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_100DPI
 	bool "font-bh-100dpi"
 	help
-	  font-bh-100dpi 1.0.0
+	  font-bh-100dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index f124bfe..752df37 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_100DPI_VERSION = 1.0.0
+XFONT_FONT_BH_100DPI_VERSION = 1.0.1
 XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_AUTORECONF = NO
-- 
1.6.3.3
