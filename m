From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:51 +0200
Subject: [Buildroot] [PATCH 12/12] arch/arm: remove ARM_EABI symbol since
	there's no users left
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <95403113defe7a6c8f713a3e2ba0c85ca1e6df3b.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 8399a8c..39406fa 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -64,9 +64,6 @@ config BR2_arm1136jf_s
 	bool
 	default BR2_arm1136jf_s_r0 || BR2_arm1136jf_s_r1
 
-config BR2_ARM_EABI
-	def_bool y
-
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
 	depends on BR2_ARM_CPU_MAYBE_HAS_NEON
-- 
1.8.1.2
