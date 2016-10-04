From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 4 Oct 2016 10:06:04 -0300
Subject: [Buildroot] [PATCH] imx6ulpico/readme: Update the image layout file
Message-ID: <1475586364-29328-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are using the common image layout now, update the
readme.txt file accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/technexion/imx6ulpico/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/technexion/imx6ulpico/readme.txt b/board/technexion/imx6ulpico/readme.txt
index ff78412..a7c3a44 100644
--- a/board/technexion/imx6ulpico/readme.txt
+++ b/board/technexion/imx6ulpico/readme.txt
@@ -46,7 +46,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/technexion/imx6ulpico/genimage.cfg.
+board/freescale/common/genimage.cfg.template.
 
 Boot the i.MX6UL Pico board
 =========================
-- 
2.7.4
