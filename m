From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-schumacher-misc to 1.1.0
Message-ID: <20100308133712.1C177776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a65577f858d9ba4498d51d8c35d4d2b398acbf50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-schumacher-misc/Config.in |    2 +-
 .../xfont_font-schumacher-misc.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-schumacher-misc/Config.in b/package/x11r7/xfont_font-schumacher-misc/Config.in
index a43115a..2d4c1c9 100644
--- a/package/x11r7/xfont_font-schumacher-misc/Config.in
+++ b/package/x11r7/xfont_font-schumacher-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
 	bool "font-schumacher-misc"
 	help
-	  font-schumacher-misc 1.0.0
+	  font-schumacher-misc 1.1.0
 	  No description available
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 5cedda2..6c8af16 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.0.0
+XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.0
 XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
 XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SCHUMACHER_MISC_AUTORECONF = NO
-- 
1.6.3.3
