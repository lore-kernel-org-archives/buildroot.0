From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:21:32 +0200
Subject: [Buildroot] [git commit] configs/olpc_xo1: needs host-openssl for
 kernel build
Message-ID: <20200421060729.2A71A8F681@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afad563bf1892fa019bb6dbd6d787d5a170278d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918178

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olpc_xo1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 48b394ac78..5919f6ab36 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9=y
 BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC=y
