From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:17:12 +0200
Subject: [Buildroot] [git commit] ci20_defconfig: update kernel version to
	ToT
Message-ID: <20161018202210.B92EE7FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c4b3bc734c1c0ed759cf7a040c4f4e0b6e2356c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/ci20_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 0455170..bd30cbd 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93b4df0786f07643eb61daee8934a3f3a05fd280"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fbf929bc733b82b15f6996d4262a45870f19d214"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 
 # u-boot
