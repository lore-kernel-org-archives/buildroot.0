From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:06:22 +0100
Subject: [Buildroot] [git commit branch/2018.11.x]
 package/freescale-imx/firmware-imx: fix typos
Message-ID: <20190118130618.F12A08DFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac701ca85ef52989f43a2b0185e316751658c201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07d1c6a2adc9a9a533cbca8fa3f0f605b27eacbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
