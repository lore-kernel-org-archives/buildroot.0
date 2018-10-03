From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:31:37 +0200
Subject: [Buildroot] [git commit] configs/riotboard: bump kernel to version
 4.18.10
Message-ID: <20181003074356.9DC9A8B745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b8f9ff06fe7c765fb6deb212b93300bab957a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
