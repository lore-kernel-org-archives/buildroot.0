From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 16:01:42 +0200
Subject: [Buildroot] [git commit] qemu_aarch64_virt_defconfig: rely on
	default Image name for kernel
Message-ID: <20151005140259.4E6CE81E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f68ea965d4f185597a9cd10f2b07c698baf857e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_aarch64_virt_defconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index f655afd..23bd9b2 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -19,5 +19,3 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.2.config"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
