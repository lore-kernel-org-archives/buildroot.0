From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:15:07 +0200
Subject: [Buildroot] [git commit branch/next] arch/arm: cortex-m7 may have a
 FPv5 FPU
Message-ID: <20180520171923.2C5AF80602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e44065ab5af177103cbf26724e48e300cffee5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index aadd14f5fc..f0488b4685 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -272,6 +272,7 @@ config BR2_cortex_m4
 config BR2_cortex_m7
 	bool "cortex-M7"
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_MAYBE_HAS_FPV5
 	select BR2_ARM_CPU_ARMV7M
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endif # !BR2_ARCH_IS_64
