From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2015 19:17:43 +0200
Subject: [Buildroot] [git commit] configs/raspberry2_defconfig: Fix typo
Message-ID: <20150802171751.C72C781D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=238a25bd02b2457731531ccb3029fcf2408275ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi2_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 7b12040..02603a2 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-BR2_LINUX_KERNEL_ZIMAGE=yo
+BR2_LINUX_KERNEL_ZIMAGE=y
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
