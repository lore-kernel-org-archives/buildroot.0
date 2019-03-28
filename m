From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 19:04:01 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update after
 licheepi_zero_defconfig addition
Message-ID: <20190328180054.62BDD886DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd849dc16fc293ef47f85abacf01618b0751c2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 68f542f679..572868a557 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -164,6 +164,7 @@ imx7d-sdb_defconfig: { extends: .defconfig }
 imx7dpico_defconfig: { extends: .defconfig }
 imx8mpico_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
+licheepi_zero_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
 minnowboard_max-graphical_defconfig: { extends: .defconfig }
 minnowboard_max_defconfig: { extends: .defconfig }
