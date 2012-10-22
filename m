From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 14:06:51 +0200
Subject: [Buildroot] [PATCH 1/7] xapp_listres: fix build against Xmu by
	bumping the version
Message-ID: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

  http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_listres/xapp_listres.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
