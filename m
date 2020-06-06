From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  6 Jun 2020 23:52:39 +0200
Subject: [Buildroot] [PATCH] gitlab-ci: regenerate after
 freescale_imx8mnevk_defconfig addition
Message-ID: <20200606215239.403537-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: 2c01eeece96ce449163e066566c787bfc2a10651

https://gitlab.com/buildroot.org/buildroot/-/jobs/584436394

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 66a679077c..f6eb7f6fe6 100644
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
-- 
2.25.4
