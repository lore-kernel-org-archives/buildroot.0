From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 23:07:19 +0200
Subject: [Buildroot] [git commit] boards/rpi: bump kernel
Message-ID: <20130603211155.E55A19A8A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c11c9e6ef249d4a6247d9439ce3ab090119268f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/rpi_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 96f63ba..e3d0a79 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -17,7 +17,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="e959a8e"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5d5301e"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
