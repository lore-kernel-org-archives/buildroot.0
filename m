From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:01 +0200
Subject: [Buildroot] [git commit] xfont_font-dec-misc: bump version
Message-ID: <20120922194218.543E799625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9de3208de543adb3b7493845973ddf6164c874d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index a00bd43..830e5cb 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_DEC_MISC_VERSION = 1.0.1
+XFONT_FONT_DEC_MISC_VERSION = 1.0.3
 XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
 XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
