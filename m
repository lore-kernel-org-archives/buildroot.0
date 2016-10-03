From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:36:36 +0200
Subject: [Buildroot] [git commit] configs/imx6ulpico: Bump to kernel 4.8
Message-ID: <20161003213642.EAB0D81EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a66f4453506370669de2868f4e6cfb9979f7390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the final kernel 4.8 has been released, let's use it
instead of 4.8-rc5.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
