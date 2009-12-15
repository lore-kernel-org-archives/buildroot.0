From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 12:23:30 +0100
Subject: [Buildroot] [PATCH 2/2] update avr32 defconfigs after uclibc avr32
	version removal
In-Reply-To: <cover.1260876205.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260876205.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8913798baf56e18fc8e9d07db82b2fd2421e670f.1260876205.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atngw100-base_defconfig |    5 ++---
 configs/atngw100_defconfig      |    5 ++---
 configs/atstk1005_defconfig     |    3 ++-
 configs/atstk100x_defconfig     |    5 ++---
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 14417c9..d89daa1 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -161,10 +161,9 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not se
-BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5=y
-# BR2_UCLIBC_VERSION_0_9_30_1 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30-avr32-2.1.5"
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_PROGRAM_INVOCATION is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 093c92c..6e244eb 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -161,10 +161,9 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
-BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5=y
-# BR2_UCLIBC_VERSION_0_9_30_1 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30-avr32-2.1.5"
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_PROGRAM_INVOCATION is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 075a871..ffca235 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -169,8 +169,9 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30-avr32-2.1.5"
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
 # BR2_PROGRAM_INVOCATION is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index ad91b8d..0b75e47 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -160,10 +160,9 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.28.9"
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 # BR2_UCLIBC_VERSION_0_9_30 is not set
-BR2_UCLIBC_VERSION_0_9_30_AVR32_2_1_5=y
-# BR2_UCLIBC_VERSION_0_9_30_1 is not set
+BR2_UCLIBC_VERSION_0_9_30_1=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30-avr32-2.1.5"
+BR2_UCLIBC_VERSION_STRING="0.9.30.1"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
 BR2_PROGRAM_INVOCATION=y
-- 
1.6.3.3
