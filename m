From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:45:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 board/freescale/imx6-sabresd: Fix the Qt5 display names
Message-ID: <20191225214909.BC5A48E474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc1fec6aa3b41a0fe9abd8841e468a9b01529b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The correct syntax that Qt5 understands for display names is
"HDMI1" and "LVDS1", so fix it accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aac5060d5d54efd5cca907d4b7fa9f8918f0db7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
