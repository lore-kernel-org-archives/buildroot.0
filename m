From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Oct 2016 12:06:55 +0100
Subject: [Buildroot] [PATCH] ci20_defconfig: update kernel version to ToT
Message-ID: <20161018110655.11657-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.10.1
