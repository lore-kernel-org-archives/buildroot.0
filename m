From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Apr 2014 14:43:32 +0200
Subject: [Buildroot] [PATCH 1/1] mesa3d: Force autoreconf to avoid running
	configure twice
Message-ID: <1397306612-20233-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f40b2ee..1e2cc53 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -9,6 +9,7 @@ MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
+MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
 
-- 
1.7.10.4
