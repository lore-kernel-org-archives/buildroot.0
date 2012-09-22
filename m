From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:01 +0200
Subject: [Buildroot] [git commit] xfont_font-ibm-type1: bump version
Message-ID: <20120922194218.BC68399625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f9f0a795ba6ea0bfb2c8c36cf849a172970cf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 2a1e634..749d355 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
+XFONT_FONT_IBM_TYPE1_VERSION = 1.0.3
 XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
