From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  7 Apr 2015 14:44:20 +0300
Subject: [Buildroot] [PATCH 2/2] board/raspberrypi: document RPi-2 defconfig
In-Reply-To: <750c74e7558083272a595596adc199be64526a4b.1428407060.git.baruch@tkos.co.il>
References: <750c74e7558083272a595596adc199be64526a4b.1428407060.git.baruch@tkos.co.il>
Message-ID: <ca0569333c0940f4d40a629d7b7fa6ec9165a893.1428407060.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Document the correct defconfig for ARMv7 based RPi-2.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 7a6df0637ad8..4ead046ffc76 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -32,6 +32,10 @@ Alternatively, if you want to test support for the Device Tree:
 
   $ make raspberrypi_dt_defconfig
 
+For Raspberry Pi 2 use a different defconfig:
+
+  $ make raspberrypi2_defconfig
+
 If you want to use a persistent rootfs, skip to "Build the rootfs", below.
 
 For a volatile rootfs, you have to slightly adjust the configuration:
-- 
2.1.4
