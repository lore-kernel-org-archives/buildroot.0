From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 11:22:14 +0100
Subject: [Buildroot] [git commit] xapp_xbiff: fix build against Xmu by
	bumping version
Message-ID: <20121104102954.3F75599ADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2020a20c1b09fd17fffee8e26f137c1531dbc195
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index f954a8d..c6f2d70 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.1
+XAPP_XBIFF_VERSION = 1.0.3
 XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
