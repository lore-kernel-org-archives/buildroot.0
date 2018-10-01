From: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Date: Mon,  1 Oct 2018 23:23:25 +0300
Subject: [Buildroot] [PATCH 1/1] configs/riotboard: bump kernel to version
 4.18.10
Message-ID: <20181001202325.1847-1-nikolay.dimitrov@retrohub.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
---
 configs/riotboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 6a37e64f8c..04d52eb4fa 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
-- 
2.11.0
