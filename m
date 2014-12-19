From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Dec 2014 15:33:27 -0300
Subject: [Buildroot] [PATCH] gcc: bump 4.8.x series to version 4.8.4
Message-ID: <1419014007-13686-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/{4.8.3 => 4.8.4}/100-uclibc-conf.patch                  | 0
 package/gcc/{4.8.3 => 4.8.4}/301-missing-execinfo_h.patch           | 0
 package/gcc/{4.8.3 => 4.8.4}/305-libmudflap-susv3-legacy.patch      | 0
 package/gcc/{4.8.3 => 4.8.4}/810-arm-softfloat-libgcc.patch         | 0
 package/gcc/{4.8.3 => 4.8.4}/830-arm_unbreak_armv4t.patch           | 0
 package/gcc/{4.8.3 => 4.8.4}/841-PR57717-E500v2.patch               | 0
 package/gcc/{4.8.3 => 4.8.4}/842-PR60155.patch                      | 0
 package/gcc/{4.8.3 => 4.8.4}/850-libstdcxx-uclibc-c99.patch         | 0
 package/gcc/{4.8.3 => 4.8.4}/900-musl-support.patch                 | 0
 .../gcc/{4.8.3 => 4.8.4}/910-gcc-poison-system-directories.patch    | 0
 .../{4.8.3 => 4.8.4}/powerpc-link-with-math-lib.patch.conditional   | 0
 package/gcc/Config.in.host                                          | 6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)
 rename package/gcc/{4.8.3 => 4.8.4}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/841-PR57717-E500v2.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/842-PR60155.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/900-musl-support.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/910-gcc-poison-system-directories.patch (100%)
 rename package/gcc/{4.8.3 => 4.8.4}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/package/gcc/4.8.3/100-uclibc-conf.patch b/package/gcc/4.8.4/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.8.3/100-uclibc-conf.patch
rename to package/gcc/4.8.4/100-uclibc-conf.patch
diff --git a/package/gcc/4.8.3/301-missing-execinfo_h.patch b/package/gcc/4.8.4/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.8.3/301-missing-execinfo_h.patch
rename to package/gcc/4.8.4/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.8.3/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/4.8.3/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.8.4/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/4.8.3/810-arm-softfloat-libgcc.patch b/package/gcc/4.8.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.8.3/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.8.4/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.8.3/830-arm_unbreak_armv4t.patch b/package/gcc/4.8.4/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.8.3/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.8.4/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.8.3/841-PR57717-E500v2.patch b/package/gcc/4.8.4/841-PR57717-E500v2.patch
similarity index 100%
rename from package/gcc/4.8.3/841-PR57717-E500v2.patch
rename to package/gcc/4.8.4/841-PR57717-E500v2.patch
diff --git a/package/gcc/4.8.3/842-PR60155.patch b/package/gcc/4.8.4/842-PR60155.patch
similarity index 100%
rename from package/gcc/4.8.3/842-PR60155.patch
rename to package/gcc/4.8.4/842-PR60155.patch
diff --git a/package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.8.4/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/4.8.4/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/4.8.3/900-musl-support.patch b/package/gcc/4.8.4/900-musl-support.patch
similarity index 100%
rename from package/gcc/4.8.3/900-musl-support.patch
rename to package/gcc/4.8.4/900-musl-support.patch
diff --git a/package/gcc/4.8.3/910-gcc-poison-system-directories.patch b/package/gcc/4.8.4/910-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/4.8.3/910-gcc-poison-system-directories.patch
rename to package/gcc/4.8.4/910-gcc-poison-system-directories.patch
diff --git a/package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ff48af1..0750807 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -32,7 +32,7 @@ choice
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
 			!BR2_powerpc_power8
-		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
+		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported X86 cores
 		depends on !BR2_x86_corei7 && !BR2_x86_jaguar
@@ -52,7 +52,7 @@ choice
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
 			!BR2_powerpc_power8
-		# SPARC -mcpu=leon3 appeared in gcc 4.8.3
+		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar
@@ -95,7 +95,7 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
+	default "4.8.4"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.2"     if BR2_GCC_VERSION_4_9_X
 	default "arc-2014.08" if BR2_GCC_VERSION_4_8_ARC
 
-- 
2.0.4
