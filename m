From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:37:11 +0000
Subject: [Buildroot] [PATCH v5 10/10] DEVELOPERS: add files related to EDK2
 for Dick Olsson
Message-ID: <nDhCDaBYqVOXqwzZhMZ2FWq4BPMKg80PdkoeRvdD8@cp4-web-027.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 DEVELOPERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 573d8d84de..b589f882b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -675,7 +675,22 @@ N:	Derrick Lyndon Pallas <derrick@meter.com>
 F:	package/ipcalc/
 
 N:	Dick Olsson <hi@senzilla.io>
+F:	board/aarch64-efi/
+F:	board/pc/
+F:	board/qemu/aarch64-sbsa/
+F:	board/qemu/aarch64-virt/
+F:	board/socionext/developerbox/
+F:	board/solidrun/macchiatobin-efi/
+F:	boot/arm-trusted-firmware/
+F:	boot/edk2/
+F:	configs/aarch64_efi_defconfig
+F:	configs/pc_x86_64_efi_defconfig
+F:	configs/qemu_aarch64_sbsa_defconfig
+F:	configs/qemu_aarch64_virt_defconfig
+F:	configs/socionext_developerbox_defconfig
+F:	configs/solidrun_macchiatobin_efi_defconfig
 F:	package/bearssl/
+F:	package/edk2-platforms/
 F:	package/execline/
 F:	package/mdevd/
 F:	package/s6-dns/
@@ -686,6 +701,7 @@ F:	package/s6-portable-utils/
 F:	package/s6-rc/
 F:	package/s6/
 F:	package/skalibs/
+F:	support/testing/tests/boot/test_edk2.py
 
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
-- 
2.30.2
