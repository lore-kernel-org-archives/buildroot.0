From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:00 +0200
Subject: [Buildroot] [git commit] xfont_font-arabic-misc: bump version
Message-ID: <20120922194213.99FE89963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9bd4446e07c0348973f4738a4963e5b78877d07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-arabic-misc.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 7558254..8802c5d 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
+XFONT_FONT_ARABIC_MISC_VERSION = 1.0.3
 XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
 XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
