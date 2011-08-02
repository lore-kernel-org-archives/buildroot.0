From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 02 Aug 2011 20:33:17 +0200
Subject: [Buildroot] [PATCH 3 of 5] toolchain-external: fix some typos
 CodeSoucery -> CodeSourcery
In-Reply-To: <patchbomb.1312309994@localhost6.localdomain6>
References: <patchbomb.1312309994@localhost6.localdomain6>
Message-ID: <f0d4cd743effaa2d65aa.1312309997@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -120,7 +120,7 @@
             - MIPS32 little endian soft float uclibc
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
-	bool "CodeSoucery PowerPC 2010.09"
+	bool "CodeSourcery PowerPC 2010.09"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -138,7 +138,7 @@
             - 970 glibc hard-float, 64 bits
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
-	bool "CodeSoucery SH 2010.09"
+	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -153,7 +153,7 @@
             - SH4A, uClibc, big endian
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
-	bool "CodeSoucery SH 2010.09"
+	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
