From: Maeva Manuel <maeva.manuel@nxp.com>
Date: Mon, 9 Sep 2019 12:15:09 +0000
Subject: [Buildroot] [PATCH 7/7] board/freescale/imx8qxpmek: update
 instructions
In-Reply-To: <20190909121525.13935-1-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
Message-ID: <20190909121525.13935-7-maeva.manuel@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

	The ahab-container.img has been replaced by
	mx8qx-ahab-container.img because of the i.MX8QM support

Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
---
 board/freescale/imx8qxpmek/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/freescale/imx8qxpmek/readme.txt b/board/freescale/imx8qxpmek/readme.txt
index 45f7915fe4..e10138f8f8 100644
--- a/board/freescale/imx8qxpmek/readme.txt
+++ b/board/freescale/imx8qxpmek/readme.txt
@@ -17,7 +17,8 @@ Build all components:
   make
 
 You will find in output/images/ the following files:
-  - ahab-container.img
+
+  - mx8qx-ahab-container.img
   - bl31.bin
   - boot.vfat
   - fsl-imx8qxp-mek.dtb
-- 
2.17.1
