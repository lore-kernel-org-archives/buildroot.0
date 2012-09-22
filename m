From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 20:45:54 +0200
Subject: [Buildroot] [git commit] xfont_encodings: bump version
Message-ID: <20120922194143.DB6839963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a7e867a94dfafd4ddd9367c58ce0f695d9f07f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Allan W. Nielsen.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 05613e5..22447a4 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.3
+XFONT_ENCODINGS_VERSION = 1.0.4
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
+XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkg-config xutil_util-macros
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
