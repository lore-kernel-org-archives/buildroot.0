From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 22:44:47 +0100
Subject: [Buildroot] [git commit] s61x9_micoboard_defconfig: move to
	internal toolchain
Message-ID: <20140316223903.50F589BFDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8573df213ef04cbc7fc60c7ad05c4a6c6f7dc5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the xilinx external toolchains have been deprecated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/s6lx9_microboard_defconfig |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index 05b4443..c54f3f4 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -1,11 +1,5 @@
 BR2_microblaze=y
 BR2_microblazeel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
