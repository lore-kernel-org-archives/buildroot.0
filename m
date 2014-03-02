From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 21:00:17 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi: bump kernel version
Message-ID: <20140302200035.6E2CC9B9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e78a7daa9faf56ea42b816e9defd58ee73f6472
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump from rpi-3.10.29 to rpi-3.10.32.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 2d1cc34..90ca906 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -15,7 +15,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cdeb937acdc0cb00e3d3bc30d6053ec53030cc64"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6ae359079d931d584c00492a7ea1d2538173b9b2"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
