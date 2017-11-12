From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 12 Nov 2017 23:16:46 +0300
Subject: [Buildroot] [PATCH/next 5/5] Add myself to MacchiatoBin releated
 packages
In-Reply-To: <20171112201646.15558-1-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
Message-ID: <20171112201646.15558-6-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a4218d9c5..39773bd65e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1474,12 +1474,18 @@ F:	package/mpir/
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
 F:	package/armbian-firmware/
+F:	boot/arm-trusted-firmware/
+F:	boot/armada-firmware/
+F:	boot/armada-ddr/
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/linksprite/pcduino
+F:	board/solidrun/macchiatobin
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_zero_defconfig
 F:	configs/linksprite_pcduino_defconfig
+F:	configs/solidrun_macchiatobin_marvell_defconfig
+F:	configs/solidrun_macchiatobin_mainline_defconfig
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
-- 
2.11.0
