From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 6 Aug 2017 21:30:07 +0200
Subject: [Buildroot] [PATCH] qemu-sparc64: update kernel
Message-ID: <20170806193007.GA11010@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes '__multi3' issue when building the kernel.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 configs/qemu_sparc64_sun4u_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 1f4df06..072fba7 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -15,6 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.11.config"
-- 
2.1.4
