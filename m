From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:13:34 +0200
Subject: [Buildroot] [git commit] board/freescale/imx8mqevk: remove hardware
 support section from readme
Message-ID: <20180829191348.599DB8184C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f57d68a229c4d71ef3c8d94ae155092ff26683b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At first the support for i.MX8MQ processors was minimal, hence this
section in the readme file.

Since then, GPU support was added [1] in master and VPU in next [2].

So drop this section as it is confusing people and no one maintains it.

[1] https://git.buildroot.net/buildroot/commit/?id=84afda9c
[2] https://git.buildroot.net/buildroot/commit/?id=82732071

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx8mqevk/readme.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index 1840290edb..a32c122f91 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -5,12 +5,6 @@ Freescale i.MX8MQ EVK board
 This file documents the Buildroot support for the Freescale i.MX8MQ
 EVK board.
 
-Hardware support
-================
-
-Currently only basic support for hardware is available, currently no
-support for GPU, VPU and other HW features.
-
 Build
 =====
 
