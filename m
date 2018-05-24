From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:53:20 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] .gitlab-ci.yml: update
 after removal of freescale defconfigs
Message-ID: <20180524210451.38B078197A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=787d8dbf3de8691e52f9a669a152edf4ec1f9d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e607881f201337198a0bb2d69c5c8507a1ebfde9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 661a3d38e1..59ce6ae59e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -110,14 +110,11 @@ engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 engicam_imx6ul_geam_defconfig: *defconfig
 engicam_imx6ul_isiot_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
-freescale_imx31_3stack_defconfig: *defconfig
 freescale_imx6dlsabreauto_defconfig: *defconfig
 freescale_imx6dlsabresd_defconfig: *defconfig
 freescale_imx6qsabreauto_defconfig: *defconfig
 freescale_imx6qsabresd_defconfig: *defconfig
-freescale_imx6sololiteevk_defconfig: *defconfig
 freescale_imx6sxsabresd_defconfig: *defconfig
-freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
 friendlyarm_nanopi_neo2_defconfig: *defconfig
