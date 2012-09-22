From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:40:42 +0200
Subject: [Buildroot] [git commit] xlib_libfontenc: version bump to 1.1.0
Message-ID: <20120922194132.05F5B995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57adb190f69cf60febcdbc58406c17eb9ca7c295
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 3e32d93..219cf7a 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.0.5
+XLIB_LIBFONTENC_VERSION = 1.1.0
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
