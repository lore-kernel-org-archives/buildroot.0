From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 00:30:33 +0200
Subject: [Buildroot] [git commit] configs/qemu_ppc64_e5500_defconfig: needs
 host-openssl for the Linux kernel build
Message-ID: <20180402223321.D46D18296F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce91cbdad351cd1ca9d5b997a27ebdc256aca58f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc64_e5500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index e4a7518f32..8173a0251b 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
