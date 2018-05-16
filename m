From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 May 2018 21:24:11 -0300
Subject: [Buildroot] [PATCH 1/2] imx8mqevk: readme: Put switch configuration
 for SD card boot
Message-ID: <1526430252-28624-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Improve the documentation by adding the configuration of SW801 and SW802
switches for SD card boot.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx8mqevk/readme.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index d50dd6e..cb7e1dc 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -63,6 +63,9 @@ Boot the i.MX8mq EVK board
 
 To boot your newly created system:
 - insert the SD card in the SD slot of the board;
+- Configure the switches as follows:
+SW801:	ON	ON	OFF	OFF
+SW802:	ON	OFF
 - put a micro USB cable into the Debug USB Port and connect using a terminal
   emulator at 115200 bps, 8n1;
 - power on the board.
-- 
2.7.4
