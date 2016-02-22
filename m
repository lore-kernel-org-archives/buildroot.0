From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:27 +0000
Subject: [Buildroot] [PATCH v2 13/15] boards: stm32f469-disco: Add a
	readme.txt
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-14-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a starting point we show users how to build and flash their boards.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 board/stmicroelectronics/stm32/stm32f469-disco/readme.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/readme.txt

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32/stm32f469-disco/readme.txt
new file mode 100644
index 0000000..043e376
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/readme.txt
@@ -0,0 +1,10 @@
+Building
+========
+
+  make stm32f469_disco_defconfig
+  make
+
+Flashing
+========
+
+  board/stmicroelectronics/stm32/stm32f429-disco/flash.sh
-- 
1.9.1
