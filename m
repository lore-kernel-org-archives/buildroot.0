From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 21:17:26 +0200
Subject: [Buildroot] [git commit branch/next] powerpc: mark 32-bit only
	powerpc cpus to prep for adding powerpc64 support
Message-ID: <20140526200606.537F49CDDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32025e99dd1c78d2b678f8b1c9bfb9090d46964a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8479103..66ca883 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -14,73 +14,102 @@ config BR2_generic_powerpc
 	bool "generic"
 config BR2_powerpc_401
 	bool "401"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_403
 	bool "403"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_405
 	bool "405"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_405fp
 	bool "405 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_440
 	bool "440"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_440fp
 	bool "440 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_464
 	bool "464"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_464fp
 	bool "464 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_476
 	bool "476"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_476fp
 	bool "476 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_505
 	bool "505"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_601
 	bool "601"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_602
 	bool "602"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_603
 	bool "603"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_603e
 	bool "603e"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_604
 	bool "604"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_604e
 	bool "604e"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
 config BR2_powerpc_630
 	bool "630"
 config BR2_powerpc_740
 	bool "740"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_7400
 	bool "7400"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_7450
 	bool "7450"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_750
 	bool "750"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_821
 	bool "821"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_823
 	bool "823"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_860
 	bool "860"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_970
 	bool "970"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
+	depends on !BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
+	depends on !BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_e300c3
 	bool "e300c3"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_e500mc
 	bool "e500mc"
+	depends on !BR2_ARCH_IS_64
 endchoice
 
 choice
