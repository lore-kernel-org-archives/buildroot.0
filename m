From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:55:23 +0100
Subject: [Buildroot] [git commit] board/freescale/imx6-sabresd: Fix the Qt5
 display names
Message-ID: <20191223195041.B66AD8E049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aac5060d5d54efd5cca907d4b7fa9f8918f0db7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The correct syntax that Qt5 understands for display names is
"HDMI1" and "LVDS1", so fix it accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
index d5d063af87..fe92ce5b29 100644
--- a/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
+++ b/board/freescale/imx6-sabresd/rootfs_overlay/root/sabresd.json
@@ -4,11 +4,11 @@
   "pbuffers": true,
   "outputs": [
     {
-      "name": "HDMI-1",
+      "name": "HDMI1",
       "mode": "off"
     },
     {
-      "name": "LVDS-1",
+      "name": "LVDS1",
       "mode": "1024x768"
     }
   ]
