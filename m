From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 08:55:50 +0200
Subject: [Buildroot] [git commit] package/imx-gpu-viv: fix Config.in
 indentation
Message-ID: <20210521062659.CC10486AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfb83cc5a1a7defda1a04b1b014e55bd72fb77fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package.

Fixes: 3d78dbace207b6b93416b27abcb85dbccde97a6b
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index ca46c5036f..f465167acd 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -92,8 +92,7 @@ config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
 	  Warning: examples take approximately 150 MB of disk space.
 
 comment "imx-gpu-viv-examples need a toolchain w/ C++ support"
-    depends on !BR2_INSTALL_LIBSTDCPP
-
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_IMX_GPU_VIV_GMEM_INFO
 	bool "install gmem_info tool"
