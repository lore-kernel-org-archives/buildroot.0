From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 09:01:38 +0100
Subject: [Buildroot] [git commit] beaglebone: add DT for BeagleBone Black
Message-ID: <20140217080316.D54B39CA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52aef8aebc114f6beb41134e0642e53e4de5ea2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The devicetree data for BeagleBone Black is the am335x???boneblack.dts file
(includes "am33xx.dtsi" and "am335x-bone-common.dtsi")

BeagleBone White uses the am335x-bone.dts file.

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 2996336..15220ed 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -36,4 +36,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
