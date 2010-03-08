From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-cronyx-cyrillic to 1.0.1
Message-ID: <20100308133707.C77C2776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=63fd24c4f59064b9e9064bfbccede688a41a6368
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-cronyx-cyrillic/Config.in |    2 +-
 .../xfont_font-cronyx-cyrillic.mk                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
index 7cac375..e549a2e 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
 	bool "font-cronyx-cyrillic"
 	help
-	  font-cronyx-cyrillic 1.0.0
+	  font-cronyx-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 8afdb13..3ed415f 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.0
+XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_CRONYX_CYRILLIC_AUTORECONF = NO
-- 
1.6.3.3
