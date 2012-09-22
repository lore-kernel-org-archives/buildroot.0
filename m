From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:14:41 +0200
Subject: [Buildroot] [git commit] xlib_libXfont: version bump to 1.4.3
Message-ID: <20120922194125.7D68F97065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ac62e21028d1dacbf417412cb3cbbba97dbcffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 463e567..c08a69b 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.4.1
+XLIB_LIBXFONT_VERSION = 1.4.3
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = YES
