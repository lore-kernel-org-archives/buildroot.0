From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Wed, 09 Mar 2011 11:40:03 +0000
Subject: [Buildroot] [PATCH] sh: Fix displayed name of CodeSourcery toolchain
Message-ID: <1299670804-26606-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
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
1.7.1
