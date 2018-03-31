From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 22:59:47 +0200
Subject: [Buildroot] [git commit] configs/s6lx9_microboard_defconfig: purge
 custom dts boolean
Message-ID: <20180331205954.24870815A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5899a8326f0fd46283732f07dea888907b763919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since custom dts files are unconditionally handled *KERNEL_USE_CUSTOM_DTS
is no longer available/needed.

Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/s6lx9_microboard_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index f77c80ba87..97b2d3fe79 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -10,5 +10,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
