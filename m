From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 23:46:21 +0100
Subject: [Buildroot] [PATCH 3/5 v2] boards/raspberrypi: don't document
	non-existent files
In-Reply-To: <cover.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <9c83ec09a41ab5cad5fb1ddcaa9547cfde77ea50.1420843412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those files were preiously installed, but that's no longer the case
since we select in the menuconfig which version of the bootloader we
install.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/raspberrypi/readme.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 8532de4..a6d3dd4 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -55,9 +55,7 @@ After building, you should obtain this tree:
     +-- rpi-firmware
     |   +-- bootcode.bin
     |   +-- config.txt
-    |   +-- fixup_cd.dat
     |   +-- fixup.dat
-    |   +-- start_cd.elf
     |   `-- start.elf
     `-- zImage
 
-- 
1.9.1
