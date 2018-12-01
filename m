From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:58:36 +0100
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external-codescape-img-mips: rewrap Config.in help text
Message-ID: <20181201215533.BA8918A2D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cffdccd952eb75daa6c515e22ac6a7cbb039d17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following check-package warnings:

toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in:13: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in:14: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in:15: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-codescape-img-mips/Config.in               | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 2e705f2460..be6e56a2cb 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -10,10 +10,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS architecture,
-	  from MIPS Tech LLC. It uses gcc 6.3.0, binutils 2.28.51, glibc 2.20,
-	  gdb 7.9.1 and kernel headers 4.7. It has support for the following
-	  variants:
+	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS
+	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
+	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
+	  4.7. It has support for the following variants:
 	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
