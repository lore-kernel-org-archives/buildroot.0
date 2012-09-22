From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:59 +0200
Subject: [Buildroot] [git commit] xfont_font-adobe-75dpi: bump version
Message-ID: <20120922194212.287B19963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9aea47e0b7c9f2d33e88153bb942c929f87e72c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-adobe-75dpi.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index e572fcc..fa1212f 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.1
+XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.3
 XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
