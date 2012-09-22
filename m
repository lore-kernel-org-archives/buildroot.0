From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:00 +0200
Subject: [Buildroot] [git commit] xfont_font-bh-100dpi: bump version
Message-ID: <20120922194213.DEE879963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a96c30b5e6fd91983849346d006b42d146f8398
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 0bddb15..2f43524 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_BH_100DPI_VERSION = 1.0.1
+XFONT_FONT_BH_100DPI_VERSION = 1.0.3
 XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
