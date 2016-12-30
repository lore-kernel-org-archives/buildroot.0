From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:15:22 +0100
Subject: [Buildroot] [git commit] configs/imx6ulpico: Select floating point
Message-ID: <20161230211734.B4BB381EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05affd1b8995a8768fa19535f92c5cf515994d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6ulpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 60de7d7..f7f7f20 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
