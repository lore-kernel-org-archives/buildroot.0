From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-bh-ttf to 1.0.1
Message-ID: <20100308133706.06A64776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60c09f6f552718e4dcfe9c2956a729ab2037596b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-bh-ttf/Config.in          |    2 +-
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-bh-ttf/Config.in b/package/x11r7/xfont_font-bh-ttf/Config.in
index 8c4d9fc..e360f6d 100644
--- a/package/x11r7/xfont_font-bh-ttf/Config.in
+++ b/package/x11r7/xfont_font-bh-ttf/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_BH_TTF
 	bool "font-bh-ttf"
 	help
-	  font-bh-ttf 1.0.0
+	  font-bh-ttf 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 2031bc6..2e6d7fe 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_TTF_VERSION = 1.0.0
+XFONT_FONT_BH_TTF_VERSION = 1.0.1
 XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
 XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TTF_AUTORECONF = NO
-- 
1.6.3.3
