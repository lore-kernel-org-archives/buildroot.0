From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 21:56:33 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix some typos
	CodeSoucery -> CodeSourcery
Message-ID: <20110804195757.DFA228B756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=54624512d8602bccd2c5e19e6b769e180dbdb886
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0253d83..ba74f18 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -120,7 +120,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
             - MIPS32 little endian soft float uclibc
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
-	bool "CodeSoucery PowerPC 2010.09"
+	bool "CodeSourcery PowerPC 2010.09"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -138,7 +138,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
             - 970 glibc hard-float, 64 bits
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
-	bool "CodeSoucery SH 2010.09"
+	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -153,7 +153,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
             - SH4A, uClibc, big endian
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
-	bool "CodeSoucery SH 2010.09"
+	bool "CodeSourcery SH 2010.09"
 	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_LARGEFILE
-- 
1.7.3.4
