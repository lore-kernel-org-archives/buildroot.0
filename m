From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 18 Jun 2017 21:42:00 +0300
Subject: [Buildroot] [PATCH 2/2] orangepi_zero_defconfig: add xradio
	wireless driver
In-Reply-To: <20170618184200.31167-1-geomatsi@gmail.com>
References: <20170618184200.31167-1-geomatsi@gmail.com>
Message-ID: <20170618184200.31167-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add xradio driver to enable on-board SDIO WiFi chip XR819.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index e023af448..c21ea50b5 100644
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
-- 
2.11.0
