From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-bitstream-speedo to 1.0.1
Message-ID: <20100308133707.2208E776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1e5e9371a32d093439ac869964efaec96a7c628
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    2 +-
 .../xfont_font-bitstream-speedo.mk                 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-bitstream-speedo/Config.in b/package/x11r7/xfont_font-bitstream-speedo/Config.in
index bd26a34..4037914 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/Config.in
+++ b/package/x11r7/xfont_font-bitstream-speedo/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
 	bool "font-bitstream-speedo"
 	help
-	  font-bitstream-speedo 1.0.0
+	  font-bitstream-speedo 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index 51bccad..f534c94 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.0
+XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_SPEEDO_AUTORECONF = NO
-- 
1.6.3.3
