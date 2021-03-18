From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:43:39 +0000
Subject: [Buildroot] [PATCH v4 10/10] DEVELOPERS: add Dick Olsson to all
 files related to EDK2
Message-ID: <XqLiVdRshCDNL7pJUp9ydjtZiSUygGi4oxYh9cic0@cp7-web-043.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 DEVELOPERS | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a7e88039e..7475c74fab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -673,6 +673,23 @@ F:	package/libstrophe/
 N:	Derrick Lyndon Pallas <derrick@meter.com>
 F:	package/ipcalc/
 
+N:	Dick Olsson <hi@senzilla.io>
+F:	board/aarch64-efi/
+F:	board/pc/
+F:	board/qemu/aarch64-sbsa/
+F:	board/qemu/aarch64-virt-efi/
+F:	board/socionext/developerbox/
+F:	board/solidrun/macchiatobin-efi/
+F:	boot/arm-trusted-firmware/
+F:	boot/edk2/
+F:	configs/aarch64_efi_defconfig
+F:	configs/pc_x86_64_efi_defconfig
+F:	configs/qemu_aarch64_sbsa_defconfig
+F:	configs/qemu_aarch64_virt_efi_defconfig
+F:	configs/socionext_developerbox_defconfig
+F:	configs/solidrun_macchiatobin_efi_defconfig
+F:	package/edk2-platforms/
+
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
 
-- 
2.24.3 (Apple Git-128)
