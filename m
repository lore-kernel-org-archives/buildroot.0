From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  9 Mar 2016 22:30:30 +0100
Subject: [Buildroot] [PATCH 3/5] firmware-imx: indentation cleanup
In-Reply-To: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457559032-3384-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
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
-- 
1.9.1
