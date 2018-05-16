From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 May 2018 21:24:12 -0300
Subject: [Buildroot] [PATCH 2/2] imx8mqevk: readme: Write the SoC name in
 capital letters
In-Reply-To: <1526430252-28624-1-git-send-email-festevam@gmail.com>
References: <1526430252-28624-1-git-send-email-festevam@gmail.com>
Message-ID: <1526430252-28624-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Use "i.MX8MQ" (in capital letters) for the SoC name for better
readability.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx8mqevk/readme.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index cb7e1dc..1840290 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -1,8 +1,8 @@
 ***************************
-Freescale i.MX8mq EVK board
+Freescale i.MX8MQ EVK board
 ***************************
 
-This file documents the Buildroot support for the Freescale i.MX8mq
+This file documents the Buildroot support for the Freescale i.MX8MQ
 EVK board.
 
 Hardware support
@@ -14,7 +14,7 @@ support for GPU, VPU and other HW features.
 Build
 =====
 
-First, configure Buildroot for the i.MX8mq EVK board:
+First, configure Buildroot for the i.MX8MQ EVK board:
 
   make freescale_imx8mqevk_defconfig
 
@@ -58,7 +58,7 @@ command as root:
 For details about the medium image layout, see the definition in
 board/freescale/common/imx/genimage.cfg.template_imx8.
 
-Boot the i.MX8mq EVK board
+Boot the i.MX8MQ EVK board
 ==========================
 
 To boot your newly created system:
-- 
2.7.4
