From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:25:42 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate with
 orangepi_pc_plus_defconfig
Message-ID: <20171203221850.344138222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f02b7df5a25db91f3fa1722e797def9e6c51bfad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dc7fd84..7e3279d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -162,6 +162,7 @@ olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_pc_defconfig: *defconfig
+orangepi_pc_plus_defconfig: *defconfig
 orangepi_plus_defconfig: *defconfig
 orangepi_zero_defconfig: *defconfig
 pandaboard_defconfig: *defconfig
