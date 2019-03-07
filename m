From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 7 Mar 2019 12:45:53 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-sc-firmware:
 properly wrap help text
Message-ID: <20190307114427.39F1984444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fec83ccc11629d68a4cfc1562e611d89476db553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
package/freescale-imx/imx-sc-firmware/Config.in:5: help text: <tab><2 spaces><62 chars>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/imx-sc-firmware/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
index 5c71618ce0..4a22f72b1f 100644
--- a/package/freescale-imx/imx-sc-firmware/Config.in
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_IMX_SC_FIRMWARE
 	bool "imx-sc-firmware"
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	help
-	  System Control Unit Firmware blobs for the Freescale i.MX8 SoCs.
+	  System Control Unit Firmware blobs for the Freescale i.MX8
+	  SoCs.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
