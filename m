From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 22:17:23 +0100
Subject: [Buildroot] [git commit] xapp_xinit: bump to 1.3.2
Message-ID: <20120201212001.A01B99096E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a2934c84cbe6e51281661b0f9fe7fef4ab0e78a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xinit/xapp_xinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 48637f2..dc1decf 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.2.1
+XAPP_XINIT_VERSION = 1.3.2
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
