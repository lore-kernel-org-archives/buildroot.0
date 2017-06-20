From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:12:28 +0200
Subject: [Buildroot] [git commit] toolchain-external: update list of
	toolchains
Message-ID: <20170620201445.034CF81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=598486cdf70eaee2c25c1bae0da15710732ef54c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove mention of toolchains the we don't have.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 856be65..8269345 100644
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
