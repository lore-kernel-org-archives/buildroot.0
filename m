From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:34:16 +0200
Subject: [Buildroot] [git commit] arch: force syntax colouring to kconfig in
 Config.in.*
Message-ID: <20190602201235.39B5581354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e837837791955c808067b29242d66ab004bec506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is too sad when an editor picks up the wrong syntax...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arc        | 3 +++
 arch/Config.in.arm        | 3 +++
 arch/Config.in.csky       | 3 +++
 arch/Config.in.m68k       | 3 +++
 arch/Config.in.microblaze | 3 +++
 arch/Config.in.mips       | 3 +++
 arch/Config.in.nios2      | 3 +++
 arch/Config.in.or1k       | 3 +++
 arch/Config.in.powerpc    | 3 +++
 arch/Config.in.riscv      | 3 +++
 arch/Config.in.sh         | 3 +++
 arch/Config.in.sparc      | 3 +++
 arch/Config.in.x86        | 3 +++
 arch/Config.in.xtensa     | 3 +++
 14 files changed, 42 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 156384b9a5..6cddbb961f 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -79,3 +79,6 @@ config BR2_ARC_PAGE_SIZE
 	default "4K" if BR2_ARC_PAGE_SIZE_4K
 	default "8K" if BR2_ARC_PAGE_SIZE_8K
 	default "16K" if BR2_ARC_PAGE_SIZE_16K
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a9972978d4..93031ab147 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -866,3 +866,6 @@ config BR2_GCC_TARGET_MODE
 config BR2_READELF_ARCH_NAME
 	default "ARM"		if BR2_arm || BR2_armeb
 	default "AArch64"	if BR2_aarch64 || BR2_aarch64_be
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2d12..420e831c21 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -46,3 +46,6 @@ config BR2_GCC_TARGET_CPU
 
 config BR2_READELF_ARCH_NAME
 	default "CSKY"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index c134df2f14..275f47f1d3 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -38,3 +38,6 @@ config BR2_GCC_TARGET_CPU
 
 config BR2_READELF_ARCH_NAME
 	default "MC68000"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 042712a1b6..5fe2906d40 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -12,3 +12,6 @@ config BR2_READELF_ARCH_NAME
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7f7aa63f06..619456c2d5 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -271,3 +271,6 @@ config BR2_GCC_TARGET_ABI
 
 config BR2_READELF_ARCH_NAME
 	default "MIPS R3000"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index 7466331016..aae435fa17 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -6,3 +6,6 @@ config BR2_ENDIAN
 
 config BR2_READELF_ARCH_NAME
 	default "Altera Nios II"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
index b31ab3e95b..abdf498fb8 100644
--- a/arch/Config.in.or1k
+++ b/arch/Config.in.or1k
@@ -6,3 +6,6 @@ config BR2_ENDIAN
 
 config BR2_READELF_ARCH_NAME
 	default "OpenRISC 1000"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 7a452a630a..92830991ff 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -216,3 +216,6 @@ config BR2_GCC_TARGET_ABI
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
 	default "PowerPC64"	if BR2_powerpc64 || BR2_powerpc64le
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 097719e846..bdd2672602 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -125,3 +125,6 @@ config BR2_GCC_TARGET_ABI
 
 config BR2_READELF_ARCH_NAME
 	default "RISC-V"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 1cb2db90ad..b5cce18e22 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -30,3 +30,6 @@ config BR2_ENDIAN
 
 config BR2_READELF_ARCH_NAME
 	default "Renesas / SuperH SH"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index b22b55142e..4c4dc61745 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -32,3 +32,6 @@ config BR2_GCC_TARGET_CPU
 config BR2_READELF_ARCH_NAME
 	default "Sparc"		if BR2_sparc
 	default "Sparc v9"	if BR2_sparc64
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f7c53a0fae..ce91317dc6 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -290,3 +290,6 @@ config BR2_GCC_TARGET_ARCH
 config BR2_READELF_ARCH_NAME
 	default "Intel 80386"			if BR2_i386
 	default "Advanced Micro Devices X86-64" if BR2_x86_64
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 14049480ec..a79d906985 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -50,3 +50,6 @@ config BR2_ARCH
 
 config BR2_READELF_ARCH_NAME
 	default "Tensilica Xtensa Processor"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
