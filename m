From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:35 +0100
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update to use kernel 3.2.35
Message-ID: <20121230113339.D158C9A555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6122be61ff5cd8256b80fbb1f34b2cde1c4cb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/sh4-r2d/readme.txt  |    2 +-
 configs/qemu_sh4_r2d_defconfig |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 0eaf1cf..9ae7496 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index d766bc3..746dc0b 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.33"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.35"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
