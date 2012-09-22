From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:02 +0200
Subject: [Buildroot] [git commit] xfont_font-micro-misc: bump version
Message-ID: <20120922194219.D6BD299625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41a65075f3e9374a92d05b1dd9f1e5f131b6d5a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 3cf0af6..cdbaaeb 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
+XFONT_FONT_MICRO_MISC_VERSION = 1.0.3
 XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
 XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
