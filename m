From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 19:43:34 +0100
Subject: [Buildroot] [git commit] beaglebone: change to zImage
Message-ID: <20140210184610.66EAC9C74E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=994bf3ce91c8f03e0907fb7819014a0b7ca532d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default U-Boot configuration is now to use a zImage instead of uImage.

Signed-off-by: Anders Darander <anders@chargestorm.se>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 4e60e3f..2996336 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -34,5 +34,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kern
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
