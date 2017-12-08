From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 10:39:20 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: refresh following the
 addition of orangepi_lite_defconfig
Message-ID: <20171208093255.0266A81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2a68936fcea83e8eb8f6dc641f3f1b34571af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/43702501

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7e3279d..f9a7f78 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -160,6 +160,7 @@ olimex_a20_olinuxino_lime_mali_defconfig: *defconfig
 olimex_a20_olinuxino_micro_defconfig: *defconfig
 olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
+orangepi_lite_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_pc_defconfig: *defconfig
 orangepi_pc_plus_defconfig: *defconfig
