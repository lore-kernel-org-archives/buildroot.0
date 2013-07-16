From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:03:19 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
	beaglebone_defconfig
In-Reply-To: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/beaglebone_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index a141320..d6b5c31 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,8 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-fpu=vfpv3 --with-float=hard"
-# BR2_SOFT_FLOAT is not set
+BR2_ARM_EABIHF=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
-- 
1.8.1.2
