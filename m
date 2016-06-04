From: Dagg <daggs@gmx.com>
Date: Sat,  4 Jun 2016 14:46:30 +0300
Subject: [Buildroot] [PATCH] odroid c2 linux: bump to revision
	f4bf29710749c450005cc0e61d58b2fd335385a9
Message-ID: <20160604114630.1817-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the odorid c2 kernel from hardkernel has advanced a bit, latest version seems to work ok.

Signed-off-by: Dagg <daggsi@gmx.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index e403f3e..e153882 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db9b5cfbd380d2316b7723599ee0c7e9d866db17"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f4bf29710749c450005cc0e61d58b2fd335385a9"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
-- 
2.8.3
