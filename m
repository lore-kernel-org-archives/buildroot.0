From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:28 +0200
Subject: [Buildroot] [PATCH 6/6] stm32flash: fix help text format
In-Reply-To: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
References: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1496163688-20870-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/stm32flash/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stm32flash/Config.in b/package/stm32flash/Config.in
index cb6f4805ed0a..87afe3b8ffa7 100644
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
-- 
2.7.4
