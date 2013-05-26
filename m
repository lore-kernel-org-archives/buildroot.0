From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:27 +0200
Subject: [Buildroot] [PATCH 17/20] freescale-imx: bump to 1.1.0
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>

This commit bumps both imx-lib and firmware-imx to version 1.1.0.

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/freescale-imx.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 0d5400b..2553f67 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREESCALE_IMX_VERSION = 12.09.01
+FREESCALE_IMX_VERSION = 1.1.0
 
 # No official download site from freescale, just this mirror
 FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
-- 
1.7.9.5
