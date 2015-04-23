From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Apr 2015 10:03:40 +0200
Subject: [Buildroot] [git commit] nitrogen6x: tweak readme wording
Message-ID: <20150423080352.0587281916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73385c30ab36fd26a43b0fff5cf59406311fe18d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The filesystem is directly written to the card, no extraction is performed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/boundarydevices/nitrogen6x/readme.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
index f01d9f0..8657be8 100644
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -2,7 +2,7 @@ Buildroot for Boundary Devices Nitrogen6X:
 
 http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/
 
-To install, simply extract rootfs.ext2 to first partition of a uSD card:
+To install, simply write rootfs.ext2 to the first partition of a uSD card:
 
 sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
 
