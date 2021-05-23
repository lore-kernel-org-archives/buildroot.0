From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:35:53 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/imx-gpu-viv: fix
 Config.in indentation
Message-ID: <20210523180931.4BDE783797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed2d65cfb63f32734b970f1e2321b8029002f548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

As reported by check-package.

Fixes: 3d78dbace207b6b93416b27abcb85dbccde97a6b
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cfb83cc5a1a7defda1a04b1b014e55bd72fb77fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 633e04883e..232e70a80b 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -91,8 +91,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	  Warning: examples take approximately 150 MB of disk space.
 
 comment "imx-gpu-viv-examples need a toolchain w/ C++ support"
-    depends on !BR2_INSTALL_LIBSTDCPP
-
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
 	bool "install gmem_info tool"
