From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:23:52 +0100
Subject: [Buildroot] [PATCH 03/12] xapp_editres: bump to 1.0.5 to fix Xmu
	related build failure
In-Reply-To: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1ac323b118de28f936926823a600b8c48926e5f1.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_editres/xapp_editres.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index e5371fa..440ce61 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_EDITRES_VERSION = 1.0.2
+XAPP_EDITRES_VERSION = 1.0.5
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
-- 
1.7.9.5
