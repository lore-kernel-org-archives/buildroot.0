From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:54:25 -0300
Subject: [Buildroot] [PATCH 05/11] qemu/sparc: update to use kernel 3.5.4
In-Reply-To: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348239271-17456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348239271-17456-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sparc_ss10_defconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 9c55458..8818ad1 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,12 +6,12 @@ BR2_sparc_supersparc=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.4 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_4=y
+# Lock to 3.5 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_5=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
