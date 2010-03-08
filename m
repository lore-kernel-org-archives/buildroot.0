From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-alias to 1.0.2
Message-ID: <20100308133703.D930B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c6fe8c0075c140e09b2f8a10c0a553e76bc4da8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-alias/Config.in           |    2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-alias/Config.in b/package/x11r7/xfont_font-alias/Config.in
index 046faaa..1a0b35f 100644
--- a/package/x11r7/xfont_font-alias/Config.in
+++ b/package/x11r7/xfont_font-alias/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ALIAS
 	bool "font-alias"
 	help
-	  font-alias 1.0.1
+	  font-alias 1.0.2
 	  No description available
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index d755f64..9da4772 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ALIAS_VERSION = 1.0.1
+XFONT_FONT_ALIAS_VERSION = 1.0.2
 XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
 XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_AUTORECONF = NO
-- 
1.6.3.3
