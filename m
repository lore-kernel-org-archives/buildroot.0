From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:12:51 +0100
Subject: [Buildroot] [git commit] xapp_xfd: bump version to 1.1.1 to fix Xmu
	related build failure
Message-ID: <20121117081602.4FD30996F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a4f38f1d9bf1d1f73a9b411eee0524b9c199638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 50f15b1..72c1aca 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFD_VERSION = 1.0.1
+XAPP_XFD_VERSION = 1.1.1
 XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
