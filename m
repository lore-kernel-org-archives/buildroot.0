From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:00:44 +0100
Subject: [Buildroot] [git commit] firmware-imx: indentation cleanup
Message-ID: <20160309220856.B638A7F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d290fb08baff2dd81aec9012f58876a0de9db67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 7e6f0e9..35cfb6d 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -26,7 +26,7 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	done
 	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
 	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
-	   $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
+		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
 
 $(eval $(generic-package))
