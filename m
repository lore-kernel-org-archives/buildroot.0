From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 09:00:51 +0200
Subject: [Buildroot] [git commit] gitlab-ci: regenerate after
 freescale_imx8mnevk_defconfig addition
Message-ID: <20200607070058.1C00882AA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e31f462a1e10287d3f75218e4d8f4233106f305a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: 2c01eeece96ce449163e066566c787bfc2a10651

https://gitlab.com/buildroot.org/buildroot/-/jobs/584436394

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4642c3065c..951f843cf2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -187,10 +187,10 @@ freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
 freescale_imx6ullevk_defconfig: { extends: .defconfig }
 freescale_imx7dsabresd_defconfig: { extends: .defconfig }
 freescale_imx8mmevk_defconfig: { extends: .defconfig }
+freescale_imx8mnevk_defconfig: { extends: .defconfig }
 freescale_imx8mqevk_defconfig: { extends: .defconfig }
 freescale_imx8qmmek_defconfig: { extends: .defconfig }
 freescale_imx8qxpmek_defconfig: { extends: .defconfig }
-freescale_imx8mnevk_defconfig: { extends: .defconfig }
 freescale_p1025twr_defconfig: { extends: .defconfig }
 freescale_t1040d4rdb_defconfig: { extends: .defconfig }
 freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
