From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 10 Jan 2021 17:16:29 +0300
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: remove S. Matyukevich from
 mcbin BSP components
In-Reply-To: <20210110141629.1510597-1-geomatsi@gmail.com>
References: <20210110141629.1510597-1-geomatsi@gmail.com>
Message-ID: <20210110141629.1510597-5-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I do not have access to MacchiatoBin hardware anymore.
So remove its BSP components from my watch list.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 828b0a6b33..621534bfbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2355,18 +2355,14 @@ F:	package/mpir/
 
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
-- 
2.30.0
