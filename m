From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 11:12:03 +0100
Subject: [Buildroot] [git commit] xapp_listres: fix build against Xmu by
	bumping the version
Message-ID: <20121104102953.D987399ADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50a331ec956815843e21f20d4838051456056a6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

  http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_listres/xapp_listres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index c701f43..1a3247b 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_LISTRES_VERSION = 1.0.1
+XAPP_LISTRES_VERSION = 1.0.3
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
