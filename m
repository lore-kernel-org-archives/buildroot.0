From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 23 Jul 2016 21:55:00 +0300
Subject: [Buildroot] [PATCH 2/3] odroidc2: bump kernel to rev
	1cb48cebb9d525e524de0ede46710bb29f54d4a6
In-Reply-To: <20160723185501.12148-1-daggs@gmx.com>
References: <20160723185501.12148-1-daggs@gmx.com>
Message-ID: <20160723185501.12148-2-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 30fa2d5..43c2787 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db9b5cfbd380d2316b7723599ee0c7e9d866db17"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1cb48cebb9d525e524de0ede46710bb29f54d4a6"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
-- 
2.9.2
