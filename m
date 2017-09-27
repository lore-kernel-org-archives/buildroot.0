From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Sep 2017 07:28:07 -0300
Subject: [Buildroot] [PATCH 1/2] .gitlab-ci.yml: Update imx6-sabresd
	defconfig entries
Message-ID: <1506508088-14552-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the conversion to SPL the imx6sabresd defconfig targets have
been renamed, so update their entries accordingly.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 38b1670..0e0773f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -120,8 +120,8 @@ gdb_bfin_bf512_defconfig: *defconfig
 grinn_chiliboard_defconfig: *defconfig
 grinn_liteboard_defconfig: *defconfig
 imx23evk_defconfig: *defconfig
-imx6q-sabresd_defconfig: *defconfig
-imx6q-sabresd_qt5_defconfig: *defconfig
+imx6-sabresd_defconfig: *defconfig
+imx6-sabresd_qt5_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
-- 
2.7.4
