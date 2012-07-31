From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:39:03 +0200
Subject: [Buildroot] [git commit branch/next] qemu/ppc-mpc8544ds: update to
	use kernel 3.4.7
Message-ID: <20120802195304.AAE6096CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e7051da75ea62b783a5418bf68fac825d9b12af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/powerpc-mpc8544ds/readme.txt |    1 +
 configs/qemu_ppc_mpc8544ds_defconfig    |    6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index 6ecdc4b..646f459 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,3 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 44c81de..8855961 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,13 +6,13 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
