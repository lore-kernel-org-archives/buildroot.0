From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:35:21 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: remove S. Matyukevich from
 mcbin BSP components
Message-ID: <20210116211625.2BE688264D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad032943ac28bce1d5012fab1cba9245afa07dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I do not have access to MacchiatoBin hardware anymore.
So remove its BSP components from my watch list.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e4f1c13fb4..f815259d2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2357,18 +2357,14 @@ F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	boot/arm-trusted-firmware/
-F:	boot/binaries-marvell/
-F:	boot/mv-ddr-marvell/
 F:	board/linksprite/pcduino
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
-F:	board/solidrun/macchiatobin
 F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
-F:	configs/solidrun_macchiatobin_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
