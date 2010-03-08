From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-mutt-misc to 1.0.1
Message-ID: <20100308133711.D7096776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=05d390efd87f65dac8f45642d7cc5270d2feccb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-mutt-misc/Config.in       |    2 +-
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-mutt-misc/Config.in b/package/x11r7/xfont_font-mutt-misc/Config.in
index 27f5084..c81508c 100644
--- a/package/x11r7/xfont_font-mutt-misc/Config.in
+++ b/package/x11r7/xfont_font-mutt-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
 	bool "font-mutt-misc"
 	help
-	  font-mutt-misc 1.0.0
+	  font-mutt-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 73e7ae8..163b3ba 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MUTT_MISC_VERSION = 1.0.0
+XFONT_FONT_MUTT_MISC_VERSION = 1.0.1
 XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
 XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MUTT_MISC_AUTORECONF = NO
-- 
1.6.3.3
