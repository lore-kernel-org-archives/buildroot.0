From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-dec-misc to 1.0.1
Message-ID: <20100308133708.C5A67776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34991630896d1bcb4d5d211b7970a540d034f30e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-dec-misc/Config.in        |    2 +-
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-dec-misc/Config.in b/package/x11r7/xfont_font-dec-misc/Config.in
index 12e295c..f682b20 100644
--- a/package/x11r7/xfont_font-dec-misc/Config.in
+++ b/package/x11r7/xfont_font-dec-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_DEC_MISC
 	bool "font-dec-misc"
 	help
-	  font-dec-misc 1.0.0
+	  font-dec-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 20b1e72..bfe624b 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_DEC_MISC_VERSION = 1.0.0
+XFONT_FONT_DEC_MISC_VERSION = 1.0.1
 XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
 XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_AUTORECONF = NO
-- 
1.6.3.3
