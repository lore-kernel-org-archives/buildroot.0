From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:53:15 +0200
Subject: [Buildroot] [git commit] configs/galileo: update kernel version to
	fix build with gcc 6.x
Message-ID: <20170905194619.A20D680AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62ec0af5fb910f08095548b33062cef20d4ca07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel used so far for the galileo boards would not successfully
build with GCC versions greater than 5.

See: https://github.com/mdr78/Linux-x1000/pull/2

Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/galileo_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 43639a4..7db3cfe 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0feded4f96ddca9816c6c1b8a4780cb4065747b9"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8b3c9d8ce1656a26b1097d9091d53bfb39fef640"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
