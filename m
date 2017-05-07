From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 13:42:12 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: sync with latest defconfig
	additions
Message-ID: <20170507114238.BBEFF82853@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6520c06e5b0478e2094a4d61a9b621579cadf0df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 435888a..a60cf91 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -86,6 +86,7 @@ beaglebone_defconfig: *defconfig
 beaglebone_qt5_defconfig: *defconfig
 chromebook_snow_defconfig: *defconfig
 ci20_defconfig: *defconfig
+ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
@@ -168,6 +169,7 @@ qemu_xtensa_lx60_defconfig: *defconfig
 qemu_xtensa_lx60_nommu_defconfig: *defconfig
 raspberrypi0_defconfig: *defconfig
 raspberrypi2_defconfig: *defconfig
+raspberrypi3_64_defconfig: *defconfig
 raspberrypi3_defconfig: *defconfig
 raspberrypi_defconfig: *defconfig
 riotboard_defconfig: *defconfig
