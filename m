From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:14:14 +0200
Subject: [Buildroot] [git commit branch/next] arch/arm: cortex-m4 may have
 an FPv4 FPU
Message-ID: <20180520171923.261C480602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee527dd91f2e9eafba8b9d3e33cd9ebaaa11cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 46bc34dd96..aadd14f5fc 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -267,6 +267,7 @@ config BR2_cortex_m3
 config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_MAYBE_HAS_FPV4
 	select BR2_ARM_CPU_ARMV7M
 config BR2_cortex_m7
 	bool "cortex-M7"
