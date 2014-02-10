From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 22:05:49 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi: bump kernel version
Message-ID: <20140210210706.0ABCF9C94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc833466b3587fa4f949020ebd72106c520c9dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump from rpi-3.10.27 to rpi-3.10.29.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index ffcb027..b334b0a 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ab2ed0dbf37e8d397e60f37621629082da75cd58"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cdeb937acdc0cb00e3d3bc30d6053ec53030cc64"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
