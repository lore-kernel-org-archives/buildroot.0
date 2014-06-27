From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:45 -0700
Subject: [Buildroot] [PATCH v2 02/11] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-3-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 39ffa8a..843ba61 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.5.7-1.0.0
+FREESCALE_IMX_VERSION = 3.10.17-1.0.0
 FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
-- 
2.0.0
