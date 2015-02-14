From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:11:33 +0100
Subject: [Buildroot] [git commit] boards/raspberrypi: update dt kernel sha1
Message-ID: <20150214091141.31E8980172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c485d8a3d11616709e23ae959341a3e6c16e9dcd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sha1 used for the DT enabled kernel is no longer available
(presumably, the rpi-3.18.y branch was rebased recently.) This updates
it to the lastest sha1 in the rpi-3.18.y branch.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_dt_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index 956b215..d841a2b 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -4,7 +4,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b9c9f8fc69aaba236169798c18dc1590fccf7acd"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03d0d9c73c17f74a7afa64ed9f022565e89b8dd5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
