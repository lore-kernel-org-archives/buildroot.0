From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-ibm-type1 to 1.0.1
Message-ID: <20100308133709.5FC51776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0bf81050adf000191d915befe8390b637954dd86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-ibm-type1/Config.in       |    2 +-
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-ibm-type1/Config.in b/package/x11r7/xfont_font-ibm-type1/Config.in
index af10978..18a73f9 100644
--- a/package/x11r7/xfont_font-ibm-type1/Config.in
+++ b/package/x11r7/xfont_font-ibm-type1/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
 	bool "font-ibm-type1"
 	help
-	  font-ibm-type1 1.0.0
+	  font-ibm-type1 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 71fbfef..85dd7f2 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_IBM_TYPE1_VERSION = 1.0.0
+XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_IBM_TYPE1_AUTORECONF = NO
-- 
1.6.3.3
