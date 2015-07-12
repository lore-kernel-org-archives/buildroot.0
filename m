From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 13:43:01 +0200
Subject: [Buildroot] [git commit] package/firmware-imx: fix legal-info
Message-ID: <20150712114318.42436818E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e0ccea25fbced5bfc02eaa519ba40e05687342a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Part of fimrware-imx were dropped in the new version, so we have less
legal-info to save.

Fixes:
    http://autobuild.buildroot.org/results/59b/59b09152700a5839af46edb554e53981569f8921

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index f5ed353..71e49e6 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -10,7 +10,7 @@ FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
 FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 	Atheros license (ath6k)
-FIRMWARE_IMX_LICENSE_FILES = EULA licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
+FIRMWARE_IMX_LICENSE_FILES = EULA licenses/vpu/EULA
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_BLOBS = ath6k sdma vpu
