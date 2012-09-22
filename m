From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:02 +0200
Subject: [Buildroot] [git commit] xfont_font-jis-misc: bump version
Message-ID: <20120922194219.8C48E99625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2af502461ec68e8bd912aac1b5cf23a8275f3d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 9ecf0da..3dda77c 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_JIS_MISC_VERSION = 1.0.1
+XFONT_FONT_JIS_MISC_VERSION = 1.0.3
 XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
