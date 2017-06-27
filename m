From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Jun 2017 20:32:15 +0200
Subject: [Buildroot] [PATCH 1/2] .gitlab-ci.yml: regenerate
Message-ID: <20170627183216.31749-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

engicam_imx6ul_isiot_defconfig was added in commit 0235bc6176, but it
should have been engicam_imx6ul_isiot_mmc_defconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f2410e862..38eaf89d19 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -92,7 +92,7 @@ cubieboard2_defconfig: *defconfig
 engicam_imx6qdl_icore_defconfig: *defconfig
 engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 engicam_imx6ul_geam_defconfig: *defconfig
-engicam_imx6ul_isiot_defconfig: *defconfig
+engicam_imx6ul_isiot_mmc_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
 firefly_rk3288_demo_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
-- 
2.13.1
