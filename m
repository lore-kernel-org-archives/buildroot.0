From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 29 Aug 2018 17:15:54 +0200
Subject: [Buildroot] [PATCH] board/freescale/imx8mqevk: remove hardware
 support section from readme
Message-ID: <20180829151554.8966-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At first the support for i.MX8MQ processors was minimal, hence this
section in the readme file.

Since then, GPU support was added [1] in master and VPU in next [2].

So drop this section as it is confusing people and no one maintains it.

[1] https://git.buildroot.net/buildroot/commit/?id=84afda9c
[2] https://git.buildroot.net/buildroot/commit/?id=82732071

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

Someone sent me a question about GPU support for i.MX8MQ, pointing out
that the EVK readme clearly says it isn't supported :(

Can this patch be included for 2018.08 release?

Also, would it be possible to update the release text [1] to mention
i.MX8MQ graphics support? Something like:
- i.MX Vivante graphics version bumped to 6.2.4.p1.2 adding support for
  Wayland and i.MX8MQ platforms

Regards,
Gary

[1] http://lists.busybox.net/pipermail/buildroot/2018-August/227070.html
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
 
-- 
2.18.0
