From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Nov 2018 09:52:33 +0100
Subject: [Buildroot] [git commit] configs/pc_x86_64_bios: needs host-openssl
 to build Linux
Message-ID: <20181127085103.701E188C0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a5c430c4de8bf1d70cfcc943f39540443bf4c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/125631915

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 1cfc0e424f..6e9220bb31 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -32,6 +32,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
