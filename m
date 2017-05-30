From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:20:22 +0200
Subject: [Buildroot] [git commit] stm32flash: fix help text format
Message-ID: <20170530212121.A9F2482A07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ff4293c94790e7f6bdb1a2c1263dc2a3998c3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stm32flash/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stm32flash/Config.in b/package/stm32flash/Config.in
index cb6f480..87afe3b 100644
--- a/package/stm32flash/Config.in
+++ b/package/stm32flash/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_STM32FLASH
 	bool "stm32flash"
 	help
 	  Open source cross platform flash program for the STM32 ARM
-	  microcontrollers using the built-in ST serial bootloader over UART
-	  or I2C.
+	  microcontrollers using the built-in ST serial bootloader
+	  over UART or I2C.
 
 	  http://sourceforge.net/projects/stm32flash/
