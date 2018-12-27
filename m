From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 27 Dec 2018 17:08:05 +0100
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/firmware-imx: Fix
 typos
In-Reply-To: <20181227160806.4466-1-nerv@dawncrow.de>
References: <20181227160806.4466-1-nerv@dawncrow.de>
Message-ID: <20181227160806.4466-2-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 0a503d7a66..f9db09dae8 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -35,7 +35,7 @@ endef
 
 define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_fw.bin.
-	# lpddr4_pmu_train_fw.bin isneeded when generating imx-boot-imx8mqevk-sd.bin
+	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
 	# which is done in post-image script.
 	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,1d)
 	$(call FIRMWARE_IMX_PREPARE_LPDDR4_FW,2d)
-- 
2.17.1
