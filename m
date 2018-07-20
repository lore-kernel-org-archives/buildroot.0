From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Fri, 20 Jul 2018 11:16:29 +0200
Subject: [Buildroot] [PATCH 1/1] imx-gpu-viv: add a missing backslash
Message-ID: <20180720091629.5723-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 511e3b3b6c..25d25e1871 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -79,7 +79,7 @@ endif
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
-		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc
+		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
 	done
 endef
 endif
-- 
2.11.0
