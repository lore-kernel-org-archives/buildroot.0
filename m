From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Feb 2018 21:18:17 +0100
Subject: [Buildroot] [PATCH 5/6] arch/arm: cortex-m4 may have an FPv4 FPU
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <d89a1216a70d229f712f66df01cf9d4800d6b0f7.1519589817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 8fd11cc157..7c0fcacc36 100644
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
-- 
2.14.1
