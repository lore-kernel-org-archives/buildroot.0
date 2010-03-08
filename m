From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-misc-cyrillic to 1.0.1
Message-ID: <20100308133710.A8A7F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3acef55918acf8fc4c380e56d417117cd3485eba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-misc-cyrillic/Config.in   |    2 +-
 .../xfont_font-misc-cyrillic.mk                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-cyrillic/Config.in b/package/x11r7/xfont_font-misc-cyrillic/Config.in
index b9a457c..d1059e0 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-misc-cyrillic/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
 	bool "font-misc-cyrillic"
 	help
-	  font-misc-cyrillic 1.0.0
+	  font-misc-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 94b6ca9..0750cf6 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.0
+XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_CYRILLIC_AUTORECONF = NO
-- 
1.6.3.3
