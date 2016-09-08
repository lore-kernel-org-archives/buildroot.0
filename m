From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 23:17:56 +0200
Subject: [Buildroot] [git commit] configs/galileo: switch back to the
	original kernel repo
Message-ID: <20160908211855.C9872821D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=054dde0eab6e5c0db2cdcd61612360093ee908da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches the galileo_defconfig to use the orignal Linux
kernel repo, which was used prior to commit
fc8cac962baf5668dbc623ae5d411b75f77d3384.

Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>
[Thomas: improved commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
