From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:12:19 +0100
Subject: [Buildroot] [git commit] xapp_xclipboard: bump to 1.1.2 to fix Xmu
	related build failure
Message-ID: <20121117081601.C6507996F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5047087f46991e3a6c58924408e10458a81b20fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index a7bc4ab..1fb7ca4 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.0.1
+XAPP_XCLIPBOARD_VERSION = 1.1.2
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
+XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
 
 $(eval $(autotools-package))
