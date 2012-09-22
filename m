From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:39:47 +0200
Subject: [Buildroot] [git commit] xlib_libSM: version bump to 1.2.0
Message-ID: <20120922194129.E462299514@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9b8d7440ac83cd65e0bca6579937218d3b5e66b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libSM/xlib_libSM.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index c4c0f3a..a8d1eff 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.1.1
+XLIB_LIBSM_VERSION = 1.2.0
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_INSTALL_STAGING = YES
