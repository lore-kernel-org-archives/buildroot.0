From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:37:18 +0200
Subject: [Buildroot] [git commit] board/armadeus/apf51: bump 4.4 LTS kernel
 to latest version
Message-ID: <20190731223503.240FE8122D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e5be8f154e803095fd77d1d013f62b5ec352715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should fix: https://gitlab.com/buildroot.org/buildroot/-/jobs/259847033

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf51_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index e834626713..26b6a447d4 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.186"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
 BR2_LINUX_KERNEL_UIMAGE=y
