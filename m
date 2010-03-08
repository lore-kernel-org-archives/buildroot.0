From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-isas-misc to 1.0.1
Message-ID: <20100308133709.AE9E7776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c038158f373f3950866d2b696bcc640ff23aea7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-isas-misc/Config.in       |    2 +-
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-isas-misc/Config.in b/package/x11r7/xfont_font-isas-misc/Config.in
index 2c349db..d067521 100644
--- a/package/x11r7/xfont_font-isas-misc/Config.in
+++ b/package/x11r7/xfont_font-isas-misc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
 	bool "font-isas-misc"
 	help
-	  font-isas-misc 1.0.0
+	  font-isas-misc 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 80ec2f2..5519b7d 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ISAS_MISC_VERSION = 1.0.0
+XFONT_FONT_ISAS_MISC_VERSION = 1.0.1
 XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
 XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ISAS_MISC_AUTORECONF = NO
-- 
1.6.3.3
