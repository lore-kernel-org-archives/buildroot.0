From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external: update
	external toolchains that have Fortran support
Message-ID: <20160703145821.0649981E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01756846289245513309e82cbe926b4ae396bcda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[Vincent: BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX also has fortran]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index b12ae30..2ac7f30 100644
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
@@ -50,6 +51,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2016.02 (based on gcc 5.3), Linaro GDB 2016.02 (based on
@@ -73,6 +75,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
 	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
@@ -522,6 +525,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -538,6 +542,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -554,6 +559,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
