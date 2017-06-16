From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:50 +0300
Subject: [Buildroot] [PATCH 05/14] toolchain-external: update list of
	toolchains
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <f22f8dbf5593b80a4076db586b4496f6745a1490.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove mention of toolchains the we don't have.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 856be65669dd..826934505e20 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -13,10 +13,9 @@
 #  * Toolchains provided by Linaro for the ARM and AArch64
 #    architectures
 #  * Sourcery CodeBench toolchains (from Mentor Graphics) for the ARM,
-#    MIPS, PowerPC, x86, x86_64 and NIOS 2 architectures. For the MIPS
+#    MIPS, PowerPC, x86_64 and NIOS 2 architectures. For the MIPS
 #    toolchain, the -muclibc variant isn't supported yet, only the
 #    default glibc-based variant is.
-#  * Xilinx toolchains for the Microblaze architecture
 #  * Synopsys DesignWare toolchains for ARC cores
 #
 # The basic principle is the following
-- 
2.11.0
