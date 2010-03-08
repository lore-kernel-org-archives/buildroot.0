From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-bitstream-type1 to 1.0.1
Message-ID: <20100308133707.5E5DD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=590e7e2f4df2caf423982a4d5fd619ca43f83816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-bitstream-type1/Config.in |    2 +-
 .../xfont_font-bitstream-type1.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-bitstream-type1/Config.in b/package/x11r7/xfont_font-bitstream-type1/Config.in
index 203d750..e3cf94a 100644
--- a/package/x11r7/xfont_font-bitstream-type1/Config.in
+++ b/package/x11r7/xfont_font-bitstream-type1/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
 	bool "font-bitstream-type1"
 	help
-	  font-bitstream-type1 1.0.0
+	  font-bitstream-type1 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 32348c2..9481eff 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.0
+XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_TYPE1_AUTORECONF = NO
-- 
1.6.3.3
