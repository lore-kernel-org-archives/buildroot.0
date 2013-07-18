From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 00:33:28 +0200
Subject: [Buildroot] [git commit] defconfig/rpi: bump kernel for misc fixes
Message-ID: <20130718224318.517B19A161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a03386fba330bc1c4efce56723a2dcec80739f37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump for a few fixes:
  - fix for slow SDcards
  - fix for USB interrupts
  - fix for tracing functions

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/rpi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 3df440f..9d608f1 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="53f7e0b"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="0006326"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
