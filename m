From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:23:57 +0100
Subject: [Buildroot] [PATCH 08/12] xapp_xfd: bump version to 1.1.1 to fix
	Xmu related build failure
In-Reply-To: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3342e0d4d3ed06cffba7683bd691ee58cbc6cf03.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
