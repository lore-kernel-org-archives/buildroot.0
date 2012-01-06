From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 10:31:10 +0100
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update to use kernel 3.2
Message-ID: <20120106093658.7C63F90018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9adf75d95d7c9692e3d0b57e10eb198cf094492a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../sh4-r2d/{linux-3.1.config => linux-3.2.config} |    0
 configs/qemu_sh4_r2d_defconfig                     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-3.1.config b/board/qemu/sh4-r2d/linux-3.2.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-3.1.config
rename to board/qemu/sh4-r2d/linux-3.2.config
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8f92a93..a35e2fa 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -18,7 +18,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.1.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
