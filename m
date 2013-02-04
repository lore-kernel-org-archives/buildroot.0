From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Mon,  4 Feb 2013 23:26:12 +0100
Subject: [Buildroot] [PATCH 1/2] Add defconfig for ATMEL at91sam9g45m10ek
	board
Message-ID: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 configs/at91sam9g45m10ek_defconfig |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 configs/at91sam9g45m10ek_defconfig

diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
new file mode 100644
index 0000000..c958859
--- /dev/null
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -0,0 +1,9 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_PACKAGE_HOST_SAM_BA=y
+BR2_TARGET_AT91BOOTSTRAP=y
+BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9m10g45ek"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9m10g45ek_nandflash"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g45"
-- 
1.7.10.4
