From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri, 11 Sep 2020 08:00:22 +0200
Subject: [Buildroot] [PATCH 1/2] configs/olpc_xo175: bump kernel version
In-Reply-To: <20200911060023.1210248-1-lkundrak@v3.sk>
References: <20200911060023.1210248-1-lkundrak@v3.sk>
Message-ID: <20200911060023.1210248-2-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update kernel to version 5.8.2.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 configs/olpc_xo175_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
index 19075fe5a2..de790d66b4 100644
--- a/configs/olpc_xo175_defconfig
+++ b/configs/olpc_xo175_defconfig
@@ -1,12 +1,11 @@
 BR2_arm=y
 BR2_pj4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olpc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
-- 
2.26.2
