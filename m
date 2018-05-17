From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:21:19 +0200
Subject: [Buildroot] [git commit] imx8mqevk: readme: Put switch
 configuration for SD card boot
Message-ID: <20180517202027.328797FF68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5c6b2464a3518ee9a49f58ed1e2428da5f6aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improve the documentation by adding the configuration of SW801 and SW802
switches for SD card boot.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx8mqevk/readme.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index d50dd6e203..cb7e1dc202 100644
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
