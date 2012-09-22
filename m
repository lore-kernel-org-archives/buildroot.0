From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:00 +0200
Subject: [Buildroot] [git commit] xfont_font-alias: bump version
Message-ID: <20120922194213.431759963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb611cfc19d028cc9c8e3366abd0558ff285ccce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 6001c28..05df961 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ALIAS_VERSION = 1.0.2
+XFONT_FONT_ALIAS_VERSION = 1.0.3
 XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
 XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
