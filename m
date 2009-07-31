From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Jul 2009 15:29:27 +0200
Subject: [Buildroot] [git commit] target/device: rename program invocation
	symbol in defconfigs
Message-ID: <20090731133252.32757777E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e15c0d07e15e94e800bd9a0cf3c24f45aeacd89c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol is now BR2_PROGRAM_INVOCATION, not BR2_UCLIBC_PROGRAM_INVOCATION.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../ARMLTD/integrator926/integrator926_defconfig   |    2 +-
 .../integrator926_huge_defconfig                   |    2 +-
 .../Atmel/at91rm9200df/at91rm9200df_defconfig      |    2 +-
 .../Atmel/at91sam9260dfc/arm_toolchain_defconfig   |    2 +-
 .../Atmel/at91sam9260dfc/at91sam9260dfc_defconfig  |    2 +-
 .../Atmel/at91sam9261ek/at91sam9261ek_defconfig    |    2 +-
 .../Atmel/at91sam9263ek/at91sam9263ek_defconfig    |    2 +-
 .../Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig  |    2 +-
 .../Atmel/atngw100-base/atngw100-base_defconfig    |    2 +-
 target/device/Atmel/atngw100/atngw100_defconfig    |    2 +-
 target/device/Atmel/atstk1005/atstk1005_defconfig  |    2 +-
 target/device/Atmel/atstk100x/atstk100x_defconfig  |    2 +-
 target/device/KwikByte/kb9202/kb9202_defconfig     |    2 +-
 target/device/valka/v100sc2_defconfig              |    2 +-
 target/device/x86/i686/i386_defconfig              |    2 +-
 target/device/x86/i686/i686_defconfig              |    2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/device/ARMLTD/integrator926/integrator926_defconfig b/target/device/ARMLTD/integrator926/integrator926_defconfig
index c90f2f8..652b935 100644
--- a/target/device/ARMLTD/integrator926/integrator926_defconfig
+++ b/target/device/ARMLTD/integrator926/integrator926_defconfig
@@ -185,7 +185,7 @@ BR2_UCLIBC_CONFIG="target/device/ARMLTD/uClibc.integrator926.config"
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
index ba7dd13..fdbabe0 100644
--- a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
+++ b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
@@ -185,7 +185,7 @@ BR2_UCLIBC_CONFIG="target/device/ARMLTD/uClibc.integrator926.config"
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
index f372d94..255f81a 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
@@ -237,7 +237,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
index bc1a4a9..e2a5ae8 100644
--- a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
@@ -232,7 +232,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
index 38e2402..dc5892d 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
@@ -255,7 +255,7 @@ BR2_ENABLE_LOCALE=y
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
index 31af798..4427334 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
@@ -258,7 +258,7 @@ BR2_ENABLE_LOCALE=y
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
index c5cc5ef..e4e1e11 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
@@ -251,7 +251,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
index 3c358be..97df4fe 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
@@ -251,7 +251,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/atngw100-base/atngw100-base_defconfig b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
index 6e668eb..716cb19 100644
--- a/target/device/Atmel/atngw100-base/atngw100-base_defconfig
+++ b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
@@ -191,7 +191,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/atngw100/atngw100_defconfig b/target/device/Atmel/atngw100/atngw100_defconfig
index 5404392..cbb6cc4 100644
--- a/target/device/Atmel/atngw100/atngw100_defconfig
+++ b/target/device/Atmel/atngw100/atngw100_defconfig
@@ -192,7 +192,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/atstk1005/atstk1005_defconfig b/target/device/Atmel/atstk1005/atstk1005_defconfig
index 4254796..4ccc3c6 100644
--- a/target/device/Atmel/atstk1005/atstk1005_defconfig
+++ b/target/device/Atmel/atstk1005/atstk1005_defconfig
@@ -197,7 +197,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/Atmel/atstk100x/atstk100x_defconfig b/target/device/Atmel/atstk100x/atstk100x_defconfig
index ebe00ce..abb86f8 100644
--- a/target/device/Atmel/atstk100x/atstk100x_defconfig
+++ b/target/device/Atmel/atstk100x/atstk100x_defconfig
@@ -191,7 +191,7 @@ BR2_UCLIBC_VERSION_0_9_30=y
 BR2_UCLIBC_VERSION_STRING="0.9.30"
 BR2_UCLIBC_CONFIG="target/device/Atmel/uClibc.config.avr32"
 # BR2_PTHREAD_DEBUG is not set
-BR2_UCLIBC_PROGRAM_INVOCATION=y
+BR2_PROGRAM_INVOCATION=y
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/KwikByte/kb9202/kb9202_defconfig b/target/device/KwikByte/kb9202/kb9202_defconfig
index 636b214..45c1c66 100644
--- a/target/device/KwikByte/kb9202/kb9202_defconfig
+++ b/target/device/KwikByte/kb9202/kb9202_defconfig
@@ -189,7 +189,7 @@ BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 
 #
 # Binutils Options
diff --git a/target/device/valka/v100sc2_defconfig b/target/device/valka/v100sc2_defconfig
index e7686dd..03ab78b 100644
--- a/target/device/valka/v100sc2_defconfig
+++ b/target/device/valka/v100sc2_defconfig
@@ -172,7 +172,7 @@ BR2_ENABLE_LOCALE=y
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/x86/i686/i386_defconfig b/target/device/x86/i686/i386_defconfig
index a4d6ae9..6f0a2c9 100644
--- a/target/device/x86/i686/i386_defconfig
+++ b/target/device/x86/i686/i386_defconfig
@@ -178,7 +178,7 @@ BR2_UCLIBC_VERSION_0_9_30_1=y
 BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
diff --git a/target/device/x86/i686/i686_defconfig b/target/device/x86/i686/i686_defconfig
index 116d0a2..463e5b7 100644
--- a/target/device/x86/i686/i686_defconfig
+++ b/target/device/x86/i686/i686_defconfig
@@ -178,7 +178,7 @@ BR2_UCLIBC_VERSION_0_9_30_1=y
 BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_UCLIBC_PROGRAM_INVOCATION is not set
+# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
-- 
1.6.3.3
