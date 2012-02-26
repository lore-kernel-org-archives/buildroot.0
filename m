From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 21:17:11 +0100
Subject: [Buildroot] [git commit] qemu/sh4-r2d: update to use kernel 3.2.6
Message-ID: <20120226202430.A6F4490B91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5b15fe4f9bc7451447cdb19cc84c1dc38642985
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_sh4_r2d_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index a35e2fa..8794b18 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -18,7 +18,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
