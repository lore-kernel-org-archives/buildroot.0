From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:58 +0200
Subject: [Buildroot] [git commit] xapp_xkill: bump version
Message-ID: <20120922194204.F033C9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f78da79741086b8e815ef3d9b093e1a2a08731aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xkill/xapp_xkill.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index c99e050..0611b3f 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKILL_VERSION = 1.0.2
+XAPP_XKILL_VERSION = 1.0.3
 XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
