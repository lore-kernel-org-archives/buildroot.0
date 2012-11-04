From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 11:23:30 +0100
Subject: [Buildroot] [git commit] xapp_xsm: fix build against Xmu by bumping
	version
Message-ID: <20121104102955.B7D5199ADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2fcfe9c8be99460a70467b3bd8d032ce7e1f32b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xsm/xapp_xsm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index aff0cc8..75640a2 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSM_VERSION = 1.0.1
+XAPP_XSM_VERSION = 1.0.2
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
