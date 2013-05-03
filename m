From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Fri,  3 May 2013 10:27:44 +0200
Subject: [Buildroot] [PATCH 2/2] firmware-imx-version: bump to version 1.1.0
In-Reply-To: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1367569664-3307-2-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(indirect version increase through refactoring)

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/firmware-imx/firmware-imx.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/firmware-imx/firmware-imx.mk b/package/firmware-imx/firmware-imx.mk
index 3b43bef..167eb35 100644
--- a/package/firmware-imx/firmware-imx.mk
+++ b/package/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FIRMWARE_IMX_VERSION = 12.09.01
+FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
 # No official download site from freescale, just this mirror
 FIRMWARE_IMX_SITE = http://download.ossystems.com.br/bsp/freescale/source
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
-- 
1.7.10.4
