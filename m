From: Xavier Roumegue <xroumegue@gmail.com>
Date: Sat,  7 Nov 2020 14:59:08 +0100
Subject: [Buildroot] [PATCH v2 7/8] board/freescale/common/imx8: Templatize
 uboot image name
In-Reply-To: <20201103233934.1ab8a7fc@windsurf.home>
References: <20201103233934.1ab8a7fc@windsurf.home>
Message-ID: <20201107135909.1265116-8-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
index 5689205083..b9d6dbde27 100644
--- a/board/freescale/common/imx/genimage.cfg.template_imx8
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -23,7 +23,7 @@ image sdcard.img {
 
   partition imx-boot {
     in-partition-table = "no"
-    image = "imx8-boot-sd.bin"
+    image = "%UBOOTBIN%"
     offset = %IMXOFFSET%
   }
 
-- 
2.28.0
