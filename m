From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 11:22:30 +0100
Subject: [Buildroot] [git commit] xapp_xfontsel: fix build against Xmu by
	bumping version
Message-ID: <20121104102954.BE67D99ADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b4418c364ef39da7c800735806040f7853f6b65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 8719bef..d4d9ca1 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.0.1
+XAPP_XFONTSEL_VERSION = 1.0.4
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
