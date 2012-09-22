From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:18:16 +0200
Subject: [Buildroot] [git commit] xlib_libXaw: version bump to 1.0.9
Message-ID: <20120922194128.CA93799514@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4647bc9f98d97305181cb83f2c2b98d050faddf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 668fd4c..6c8a681 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.7
+XLIB_LIBXAW_VERSION = 1.0.9
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_INSTALL_STAGING = YES
