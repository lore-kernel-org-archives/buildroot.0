From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:13:52 +0100
Subject: [Buildroot] [PATCH 12/13] toolchain/toolchain-external: update
	external toolchain configuration with BR2_TOOLCHAIN_HAS_FORTRAN
In-Reply-To: <1467040433-40356-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040433-40356-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040433-40356-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

[Vincent: BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX also has fortran]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4abd658..d1f3051 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
@@ -73,6 +74,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
 	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
@@ -522,6 +524,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -538,6 +541,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
-- 
2.7.3
