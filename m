From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-screen-cyrillic to 1.0.2
Message-ID: <20100308133712.58D58776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a57972c76af79a5d84da093b277ab6830d9aa8f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-screen-cyrillic/Config.in |    2 +-
 .../xfont_font-screen-cyrillic.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-screen-cyrillic/Config.in b/package/x11r7/xfont_font-screen-cyrillic/Config.in
index be5fb30..2def7b9 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-screen-cyrillic/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
 	bool "font-screen-cyrillic"
 	help
-	  font-screen-cyrillic 1.0.1
+	  font-screen-cyrillic 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index d982e6c..14fcd70 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.1
+XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
 XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SCREEN_CYRILLIC_AUTORECONF = NO
-- 
1.6.3.3
