From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:17:23 +0100
Subject: [Buildroot] [git commit] configs/warp7: Add floating point support
Message-ID: <20161230211734.CCF3081EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f817c30395c3f9c4e92ba4be845f78f61d20d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/warp7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 2d59626..90a7338 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
