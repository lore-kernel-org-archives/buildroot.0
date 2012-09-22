From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:02 +0200
Subject: [Buildroot] [git commit] xfont_font-screen-cyrillic: bump version
Message-ID: <20120922194222.6779E99625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1247308419f4ca0f9c94c43711356b12ff65f41f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-screen-cyrillic.mk                  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 70772fb..db22b9b 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
+XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.4
 XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
