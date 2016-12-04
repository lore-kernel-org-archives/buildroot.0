From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 21:53:44 +0100
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime_mali:
	bump kernel version
Message-ID: <20161204205404.6668A81807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f57350329cd43a0121b039ac0bdc920ac9818e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel to the next commit which fix the build with gcc6.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/olimex_a20_olinuxino_lime_mali_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index 35af5f9..4930660 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
 # based on Linux version 3.4.113
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dbabbacbbf8984dea0a8c893b38b376a6ecbb3c1"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc385cc6dfa350382ecc94a520a716b57e654410"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
