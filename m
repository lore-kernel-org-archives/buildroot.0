From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:10:56 +0100
Subject: [Buildroot] [git commit] xapp_viewres: bump to 1.0.3 to fix Xmu
	related build failure
Message-ID: <20121117081601.87F5D996F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44039de8702f9680cf37767b77d66f373e88234a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_viewres/xapp_viewres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 622dcd9..04ba936 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.1
+XAPP_VIEWRES_VERSION = 1.0.3
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
