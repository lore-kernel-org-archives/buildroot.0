From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 19 Apr 2016 16:53:11 +0200
Subject: [Buildroot] [PATCH v2 6/6] board/atmel: update documentation with
	development defconfigs
In-Reply-To: <1461077591-24238-1-git-send-email-ludovic.desroches@atmel.com>
References: <1461077591-24238-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1461077591-24238-7-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a description of the development defconfig files.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
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
 
-- 
2.5.0
