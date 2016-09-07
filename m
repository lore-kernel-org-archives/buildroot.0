From: Padraig James Connolly <padraig.connolly@intel.com>
Date: Wed,  7 Sep 2016 11:41:32 +0100
Subject: [Buildroot] [PATCH] platform: intel galileo change to defconfig
Message-ID: <1473244892-16451-1-git-send-email-padraig.connolly@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changing defconfig to pull from original repo
*Defconfig now pulls 3.14 kernel from mdr78 repo instead of padraigconnolly repo
*mdr78 repo has been updated to contain 3.14 kernel

Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>
---
 configs/galileo_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 4f63c23..f0c308a 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -11,8 +11,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/padraigconnolly/Linux-x1000.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ceeb288e39a4ba10643dec9ffb91baabf313f7d1"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0feded4f96ddca9816c6c1b8a4780cb4065747b9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.5.5
