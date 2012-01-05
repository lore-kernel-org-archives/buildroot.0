From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 13:30:22 -0300
Subject: [Buildroot] [PATCH 9/9] qemu/sparc-ss10: update to use kernel
	version 3.2
In-Reply-To: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325781022-19371-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325781022-19371-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sparc_ss10_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 20cd9fb..834514f 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,6 +9,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
