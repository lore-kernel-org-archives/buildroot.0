From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 17:57:30 +0200
Subject: [Buildroot] [PATCH v8 02/28] mesa3d: Bump version to 10.2-rc3
In-Reply-To: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400342276-10303-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 63ba574..8416501 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.0.4
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_VERSION = 10.2
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).0-rc3.tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
-- 
1.7.10.4
