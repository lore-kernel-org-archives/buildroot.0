From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:01 +0200
Subject: [Buildroot] [git commit] xfont_font-cursor-misc: bump version
Message-ID: <20120922194217.B156499625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=579f7b124726cf386c66cb2a5e630a8c651e2f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-cursor-misc.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 1d366df..c193a4a 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
+XFONT_FONT_CURSOR_MISC_VERSION = 1.0.3
 XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
 XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
