From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:09:14 +0200
Subject: [Buildroot] [git commit] imx6ulpico/readme: Update the image layout
	file
Message-ID: <20161005210917.EB4338222E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b9bbb537e2fefe0e437dfab5a8b085bc7c98699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are using the common image layout now, update the
readme.txt file accordingly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
