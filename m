From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:35:02 +0200
Subject: [Buildroot] [git commit] xfont_font-misc-cyrillic: bump version
Message-ID: <20120922194220.274D499625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b906c47a5ef74230b5c1519fb9314b9f70bbe9f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-misc-cyrillic.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index fd5d8e0..d45f223 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
+XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.3
 XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
