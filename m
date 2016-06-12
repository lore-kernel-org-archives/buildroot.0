From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:39:38 +0200
Subject: [Buildroot] [git commit] board/atmel: update documentation with
	development defconfigs
Message-ID: <20160612193951.5B575817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f075afcbd6445b470b7556574a06ed712232807e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a description of the development defconfig files.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/readme.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index ea83d17..3a79e57 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -10,15 +10,30 @@ This guide covers the following configurations:
  - atmel_sama5d3xek_defconfig (sama5d31, sama5d33, sama5d34, sama5d35,
    sama5d36)
  - atmel_sama5d3_xplained_defconfig
+ - atmel_sama5d3_xplained_dev_defconfig
  - atmel_sama5d3_xplained_mmc_defconfig
+ - atmel_sama5d3_xplained_mmc_dev_defconfig
  - atmel_sama5d4ek_defconfig
  - atmel_sama5d4_xplained_defconfig
+ - atmel_sama5d4_xplained_dev_defconfig
  - atmel_sama5d4_xplained_mmc_defconfig
+ - atmel_sama5d4_xplained_mmc_dev_defconfig
  - atmel_sama5d2_xplained_mmc_defconfig
+ - atmel_sama5d2_xplained_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
 
+The configurations labeled as 'dev' provide a development rootfs with tools to
+tests the features of the SoC:
+- ALSA tools to test audio
+- FFMPEG to record video from the ISI/ISC
+- I2C, SPI, CAN, etc. tools
+- modetest for LCD screens, HDMI
+- Wilc1000 firmware for the Atmel Wireless sdio module
+- SSH for convenience
+- GDB/GDB server for debug
+
 Configuring and building Buildroot
 ==================================
 
