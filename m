From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-jis-misc to 1.0.1
Message-ID: <20100308133710.1D336776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e883e48585f3cefe226c623afa98893f9ee8e78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-jis-misc/Config.in        |    2 +-
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-jis-misc/Config.in b/package/x11r7/xfont_font-jis-misc/Config.in
index 9f4ed3e..e406671 100644
--- a/package/x11r7/xfont_font-jis-misc/Config.in
+++ b/package/x11r7/xfont_font-jis-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_JIS_MISC
 	bool "font-jis-misc"
 	help
-	  font-jis-misc 1.0.0
+	  font-jis-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 8ec4af0..7f73894 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_JIS_MISC_VERSION = 1.0.0
+XFONT_FONT_JIS_MISC_VERSION = 1.0.1
 XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_AUTORECONF = NO
-- 
1.6.3.3
