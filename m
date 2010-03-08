From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-bitstream-75dpi to 1.0.1
Message-ID: <20100308133706.D0A2F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=03d3c1e61e0d5ccf8dc12fcd99a3eaf9861c23c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-bitstream-75dpi/Config.in |    2 +-
 .../xfont_font-bitstream-75dpi.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
index d6c5e85..a12d6f8 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/Config.in
+++ b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
 	bool "font-bitstream-75dpi"
 	help
-	  font-bitstream-75dpi 1.0.0
+	  font-bitstream-75dpi 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index 8a06571..a646b7a 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.0
+XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_75DPI_AUTORECONF = NO
-- 
1.6.3.3
