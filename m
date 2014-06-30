From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:01 +0200
Subject: [Buildroot] [PATCH 01/14] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <7139dda2c668a5cae3ee54d8319a99529c7deec9.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

Bumping the version requires some heavy changes in the different
i.MX related packages. Instead of having a single huge patch, those
changes are split in smaller patches, one per affected package.

This has the inconvenient side-effect of breaking the build right
now with the bump; but it is better since the patches are easier to
understand.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: expand commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
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
1.9.1
