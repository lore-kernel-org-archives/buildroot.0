From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Tue, 26 Apr 2011 20:58:30 +0200
Subject: [Buildroot] [git commit] sh: Fix displayed name of CodeSourcery
	toolchain
Message-ID: <20110426190217.9B5D482A63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ffa7b997235ca1a6494d976cd05f173fe438a37a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2ed65bf..d9a0034 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -87,7 +87,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
             - 970 glibc hard-float, 64 bits
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
-	bool "CodeSoucery PowerPC 2010.09"
+	bool "CodeSoucery SH 2010.09"
 	depends on BR2_sh
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
@@ -98,7 +98,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	  the following variants:
             - SH4A, glibc, little endian
             - SH4A, glibc, big endian
-	    - SH4A, uClibc, little endian
+            - SH4A, uClibc, little endian
             - SH4A, uClibc, big endian
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-- 
1.7.3.4
