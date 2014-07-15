From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:18:56 +0200
Subject: [Buildroot] [PATCH v14 01/20] package/mesa3d: Bump to version 10.2.3
In-Reply-To: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405451955-10204-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ca35eb9..49bc849 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.2.1
+MESA3D_VERSION = 10.2.3
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
