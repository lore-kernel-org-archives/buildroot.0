From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-daewoo-misc to 1.0.1
Message-ID: <20100308133708.8318F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bc9dcba3265a83f401914913d346234566f2058
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-daewoo-misc/Config.in     |    2 +-
 .../xfont_font-daewoo-misc.mk                      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-daewoo-misc/Config.in b/package/x11r7/xfont_font-daewoo-misc/Config.in
index 8d089db..cad2ef3 100644
--- a/package/x11r7/xfont_font-daewoo-misc/Config.in
+++ b/package/x11r7/xfont_font-daewoo-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
 	bool "font-daewoo-misc"
 	help
-	  font-daewoo-misc 1.0.0
+	  font-daewoo-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index d013a61..f26ddd5 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.0
+XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.1
 XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_AUTORECONF = NO
-- 
1.6.3.3
