From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 18:31:04 +0100
Subject: [Buildroot] [git commit] configs/qemu_aarch64_virt: needs
 host-openssl for the Linux kernel build
Message-ID: <20180324173233.A6CBA839E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d7087414bba3058c9905ec84d2aec2dfdfe228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/59015465

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_aarch64_virt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 3bafd90e5a..076773302d 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.15.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
