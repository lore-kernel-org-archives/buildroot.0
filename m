From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:22:15 +0200
Subject: [Buildroot] [PATCH 4 of 6] toolchain-external/Config.in: fix
	indentation
In-Reply-To: <patchbomb.1338924131@beantl019720>
References: <patchbomb.1338924131@beantl019720>
Message-ID: <e55e13430259ffe12819.1338924135@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the indentation of the external toolchain Config file, where tabs
and spaces are mixed as indentation even within the same block.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 toolchain/toolchain-external/Config.in |  342 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------------
 1 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -69,16 +69,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.6.1, binutils 2.21.53, glibc
 	  2.13 and gdb 7.2.50, kernel headers 3.0.1. It has support
 	  for the following variants:
-            - ARMv5TE, little endian, soft-float, glibc
-              Select ARM926T, ARM10T, XScale or another ARMv5 core
-              Select BR2_SOFT_FLOAT
-            - ARMv4T, little endian, soft-float, glibc
-              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-              Select BR2_SOFT_FLOAT
-            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mthumb
+	    - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	bool "Sourcery CodeBench ARM 2011.03"
@@ -90,16 +90,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
 	  2.13 and gdb 7.2.50, kernel headers 2.6.38. It has support
 	  for the following variants:
-            - ARMv5TE, little endian, soft-float, glibc
-              Select ARM926T, ARM10T, XScale or another ARMv5 core
-              Select BR2_SOFT_FLOAT
-            - ARMv4T, little endian, soft-float, glibc
-              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-              Select BR2_SOFT_FLOAT
-            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mthumb
+	    - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	bool "Sourcery CodeBench ARM 2010.09"
@@ -111,16 +111,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.5.1, binutils 2.20, glibc
 	  2.11 and gdb 7.2.50, kernel headers 2.6.35.2. It has support
 	  for the following variants:
-            - ARMv5TE, little endian, soft-float, glibc
+	    - ARMv5TE, little endian, soft-float, glibc
 	      Select ARM926T, ARM10T, XScale or another ARMv5 core
-              Select BR2_SOFT_FLOAT
-            - ARMv4T, little endian, soft-float, glibc
-              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-              Select BR2_SOFT_FLOAT
-            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mthumb
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	bool "Sourcery CodeBench ARM 2010q1"
@@ -132,16 +132,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
 	  2.11, gdb 7.0.50 and kernel headers 2.6.32. It has support
 	  for the following variants:
-             - ARMv5T, little endian, soft-float, glibc
-               Select ARM926T, ARM10T, XScale or another ARMv5 core
-               Select BR2_SOFT_FLOAT
-             - ARMv4T, little endian, soft-float, glibc
-               Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-               Select BR2_SOFT_FLOAT
-             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-               Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-               Select BR2_SOFT_FLOAT
-               Set BR2_TARGET_OPTIMIZATION to -mthumb
+	     - ARMv5T, little endian, soft-float, glibc
+	       Select ARM926T, ARM10T, XScale or another ARMv5 core
+	       Select BR2_SOFT_FLOAT
+	     - ARMv4T, little endian, soft-float, glibc
+	       Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	       Select BR2_SOFT_FLOAT
+	     - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	       Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	       Select BR2_SOFT_FLOAT
+	       Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	bool "Sourcery CodeBench ARM 2009q3"
@@ -153,16 +153,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
 	  2.10 and gdb 6.8 and kernel headers 2.6.30. It has support
 	  for the following variants:
-            - ARMv5T, little endian, soft-float, glibc
-              Select ARM926T, ARM10T, XScale or another ARMv5 core
-              Select BR2_SOFT_FLOAT
-            - ARMv4T, little endian, soft-float, glibc
-              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-              Select BR2_SOFT_FLOAT
-            - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mthumb
+	    - ARMv5T, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv4T, little endian, soft-float, glibc
+	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+	      Select BR2_SOFT_FLOAT
+	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	bool "Sourcery CodeBench MIPS 2011.03"
@@ -174,44 +174,44 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
 	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
 	  2.6.38. It has support for the following variants:
-            - MIPS32 O32 big endian glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-            - MIPS32 O32 little endian glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL
-            - MIPS32 big endian soft float glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-            - MIPS32 little endian soft float glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL
-            - MIPS32 big endian microMIPS glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mips16
-            - MIPS32 little endian microMIPS glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-            - MIPS32 big endian soft float microMIPS glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mips16
-            - MIPS32 little endian soft float microMIPS glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-            - MIPS32 big endian uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 little endian uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 big endian soft float uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 little endian soft float uclibc
-              Not usable in Buildroot yet.
+	    - MIPS32 O32 big endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32 O32 little endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	    - MIPS32 little endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 big endian soft float uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian soft float uclibc
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "Sourcery CodeBench MIPS 4.4"
@@ -223,44 +223,44 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  Mentor Graphics. It uses gcc 4.4.1, binutils 2.19, glibc
 	  2.11, uClibc 0.9.30 and gdb 7.0, kernel headers 2.6.32. It
 	  has support for the following variants:
-            - MIPS32 O32 big endian glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-            - MIPS32 O32 little endian glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL
-            - MIPS32 big endian soft float glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-            - MIPS32 little endian soft float glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL
-            - MIPS32 big endian microMIPS glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mips16
-            - MIPS32 little endian microMIPS glibc
-              Select a MIPS generic core
-              Disable BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-            - MIPS32 big endian soft float microMIPS glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -mips16
-            - MIPS32 little endian soft float microMIPS glibc
-              Select a MIPS generic core
-              Select BR2_SOFT_FLOAT
-              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
-            - MIPS32 big endian uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 little endian uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 big endian soft float uclibc
-              Not usable in Buildroot yet.
-            - MIPS32 little endian soft float uclibc
-              Not usable in Buildroot yet.
+	    - MIPS32 O32 big endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32 O32 little endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	    - MIPS32 little endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 big endian soft float uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian soft float uclibc
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
@@ -272,22 +272,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
 	  glibc 2.13, gdb 7.2.50 and kernel headers 2.6.38. It has
 	  support for the following variants:
-            - 603 glibc, 32 bits
+	    - 603 glibc, 32 bits
 	      Select a generic PowerPC core
 	      Disable BR2_SOFT_FLOAT
-            - 603 soft float glibc, 32 bits
+	    - 603 soft float glibc, 32 bits
 	      Select a generic PowerPC core
 	      Enable BR2_SOFT_FLOAT
-            - e600 altivec glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te600
-            - e500v1 glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500v1
-            - e500v2 glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500v2
-            - e500mc glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500mc
-            - 970 glibc hard-float, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	    - e600 altivec glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te600
+	    - e500v1 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v1
+	    - e500v2 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v2
+	    - e500mc glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500mc
+	    - 970 glibc hard-float, 64 bits
+	      Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "Sourcery CodeBench PowerPC 2010.09"
@@ -299,22 +299,22 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
 	  glibc 2.11, gdb 7.2.50 and kernel headers 2.6.35.2. It has
 	  support for the following variants:
-            - 603 glibc, 32 bits
+	    - 603 glibc, 32 bits
 	      Select a generic PowerPC core
 	      Disable BR2_SOFT_FLOAT
-            - 603 soft float glibc, 32 bits
+	    - 603 soft float glibc, 32 bits
 	      Select a generic PowerPC core
 	      Enable BR2_SOFT_FLOAT
-            - e600 altivec glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te600
-            - e500v1 glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500v1
-            - e500v2 glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500v2
-            - e500mc glibc, 32 bits
-              Set BR2_TARGET_OPTIMIZATION to -te500mc
-            - 970 glibc hard-float, 64 bits
-              Set BR2_TARGET_OPTIMIZATION to -m64
+	    - e600 altivec glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te600
+	    - e500v1 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v1
+	    - e500v2 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v2
+	    - e500mc glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500mc
+	    - 970 glibc hard-float, 64 bits
+	      Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
@@ -326,14 +326,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
 	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
 	  2.6.38. It has support for the following variants:
-            - SH4A, glibc, little endian
-              Default.
-            - SH4A, glibc, big endian
-              Add -mb to BR2_TARGET_OPTIMIZATION
-            - SH4A, uClibc, little endian
-              Not usable in Buildroot yet.
-            - SH4A, uClibc, big endian
-              Not usable in Buildroot yet.
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "Sourcery CodeBench SH 2010.09"
@@ -345,14 +345,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
 	  glibc 2.11, uClibc 0.9.30, gdb 7.2.50 and kernel headers
 	  2.6.35.2. It has support for the following variants:
-            - SH4A, glibc, little endian
-              Default.
-            - SH4A, glibc, big endian
-              Add -mb to BR2_TARGET_OPTIMIZATION
-            - SH4A, uClibc, little endian
-              Not usable in Buildroot yet.
-            - SH4A, uClibc, big endian
-              Not usable in Buildroot yet.
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	bool "Sourcery CodeBench SH 2011.03"
@@ -369,7 +369,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
 	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.38. It has
 	  support for the following variants:
-            - SH2A, uClibc, big endian
+	    - SH2A, uClibc, big endian
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	bool "Sourcery CodeBench SH 2010.09"
@@ -386,7 +386,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCE
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
 	  uClibc 0.9.30, gdb 7.2.50 and kernel headers 2.6.35.2. It
 	  has support for the following variants:
-            - SH2A, uClibc, big endian
+	    - SH2A, uClibc, big endian
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	bool "Sourcery CodeBench x86/x86_64 2011.09"
@@ -485,10 +485,10 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MIC
 	  http://wiki.xilinx.com/mb-gnu-tools
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-       bool "Custom toolchain"
-       help
-         Use this option to use a custom toolchain pre-installed on
-         your system.
+	bool "Custom toolchain"
+	help
+	  Use this option to use a custom toolchain pre-installed on
+	  your system.
 
 endchoice
 
