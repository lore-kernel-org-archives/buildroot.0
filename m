From: Dagg Stompler <daggs@gmx.com>
Date: Fri, 27 Jan 2017 11:44:02 +0200
Subject: [Buildroot] [PATCH] odroidc2: bump kernel version to
	a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c
Message-ID: <20170127094402.6393-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this kernel rev has numerous bug fixes, framework upgrades and new
features added.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index ecee2ad1e..f2d82296d 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="925e508d37c76848881a8c8f7e9b02abc5731d88"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
-- 
2.11.0
