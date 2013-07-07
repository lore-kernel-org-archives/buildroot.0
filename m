From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 21:38:32 +0200
Subject: [Buildroot] [git commit] config/rpi: bump kernel
Message-ID: <20130707200244.9BBE79A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04388c40c50c24b87df7f5bd920ee023ece5d33f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misc fixes and enhancements:
  - faster image blitting in framebuffer
  - USB fixes, and use of FIQ instead of plain IRQ
  - generic ARM fixes for memset
  - BT l2cap fix

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/rpi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 40fd333..3df440f 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5516fc2"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="53f7e0b"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
