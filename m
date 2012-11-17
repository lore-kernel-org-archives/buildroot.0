From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:14:31 +0100
Subject: [Buildroot] [git commit] xapp_xvidtune: bump version to 1.0.2 to
	fix Xmu related build failure
Message-ID: <20121117081603.8830B996F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56fc639584735ce0b9d9cf754880d245ced2bf3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 8ac49f7..eb1cac2 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XVIDTUNE_VERSION = 1.0.1
+XAPP_XVIDTUNE_VERSION = 1.0.2
 XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
