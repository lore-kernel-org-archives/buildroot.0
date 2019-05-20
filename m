From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 20 May 2019 21:32:21 +0200
Subject: [Buildroot] [RFC PATCH 2/4] configs/bananapro_defconfig: set
 patches directory
In-Reply-To: <20190520193223.14071-1-b.bilas@grinn-global.com>
References: <20190520193223.14071-1-b.bilas@grinn-global.com>
Message-ID: <20190520193223.14071-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/bananapro_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index d5284bdd4c..56166c9428 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-- 
2.21.0
