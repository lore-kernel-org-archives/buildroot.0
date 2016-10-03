From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  3 Oct 2016 18:21:48 -0300
Subject: [Buildroot] [PATCH] configs/imx6ulpico: Bump to kernel 4.8
Message-ID: <1475529708-4363-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the final kernel 4.8 has been released, let's use it
instead of 4.8-rc5.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulpico_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index d94478a..71277d9 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -17,7 +17,7 @@ BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8-rc5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
