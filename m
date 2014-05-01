From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:50 +0200
Subject: [Buildroot] [PATCH 1/8] mesa3d: Bump version to 10.1.1
In-Reply-To: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398968277-9044-2-git-send-email-bernd.kuhls@t-online.de>
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
index a09e4c6..8f18d2b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.0.4
+MESA3D_VERSION = 10.1.1
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
