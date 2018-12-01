From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:57:40 +0100
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-external-codescape-mti-mips: rewrap Config.in.help text
Message-ID: <20181201215533.B47B08A2D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16aa13e585cc3aba8acc539a1c5c5aa4c244d7f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following check-package warnings:

toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in:14: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in:15: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in:16: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-codescape-mti-mips/Config.in               | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index c07a1b88b5..15d6284766 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -11,10 +11,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS architecture,
-	  from MIPS Tech LLC. It uses gcc 6.3.0, binutils 2.28.51, glibc 2.20,
-	  gdb 7.9.1 and kernel headers 4.7. It has support for the following
-	  variants:
+	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS
+	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
+	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
+	  4.7. It has support for the following variants:
 	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
