From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:39:59 +0200
Subject: [Buildroot] [git commit] configs: use new EABIhf option for
	beaglebone_defconfig
Message-ID: <20130716140823.7FBE79A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2dc7be318557412a553fae6647495de66dd0e66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/beaglebone_defconfig |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
