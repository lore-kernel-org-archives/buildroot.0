From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:02 +0200
Subject: [Buildroot] [git commit] xfont_font-misc-misc: bump version
Message-ID: <20120922194221.7167399625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90b7d874f47f807be762f67e2c903ca33ce953b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 1cdf0e5..e4714b0 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_MISC_VERSION = 1.1.0
+XFONT_FONT_MISC_MISC_VERSION = 1.1.2
 XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
 XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
