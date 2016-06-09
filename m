From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:05:28 +0200
Subject: [Buildroot] [git commit] configs/arm_juno: use 4.6 mainline kernel
Message-ID: <20160609200553.7D9FA820FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0924208839336f1a1bb29eb1a627005ba6b9065d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
[Thomas: use BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_juno_defconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 5ce882c..75ed63c 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -1,13 +1,11 @@
 BR2_aarch64=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TARGET_GENERIC_HOSTNAME="juno-buildroot"
 BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno by Buildroot"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/kernel/linux-linaro-tracking.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-4.3-2015.11"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
