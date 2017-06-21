From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:40:31 +0200
Subject: [Buildroot] [git commit] orangepi_zero_defconfig: add xradio
	wireless driver
Message-ID: <20170621203945.73D3E7FDF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0697b86091be0f979fa268a34053ca7a033da090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add xradio driver to enable on-board SDIO WiFi chip XR819.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/orangepi_zero_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index e023af4..c21ea50 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -30,6 +30,9 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
+# wireless driver
+BR2_PACKAGE_XR819_XRADIO=y
+
 # wireless support
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
