From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:56 +0200
Subject: [Buildroot] [git commit] xapp_luit: bump version
Message-ID: <20120922194158.A9B899963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60e21b7cd7f23daefcec3deb113121c2d9a79b52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_luit/xapp_luit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index 2ebada8..7a0ab35 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_LUIT_VERSION = 1.0.4
+XAPP_LUIT_VERSION = 1.1.0
 XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
