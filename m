From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 16 Apr 2017 11:14:08 -0400
Subject: [Buildroot] [RFC 1/2] configs: raspberrypi3: fix mismatch cpu arch
In-Reply-To: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
References: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The raspberrypi3 is powered by a Broadcom BCM2837 which is a Cortex-A53.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 configs/raspberrypi3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 1b2134e0b..3d8949765 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -1,5 +1,5 @@
 BR2_arm=y
-BR2_cortex_a7=y
+BR2_cortex_a53=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-- 
2.12.1
