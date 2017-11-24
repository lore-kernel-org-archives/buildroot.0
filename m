From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 08:51:56 +0100
Subject: [Buildroot] [git commit] DEVELOPERS,
 .gitlab-ci.yml: fix typoes in imx6sx-sdb board name
Message-ID: <20171201205335.8A9AF7FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7acccf5f254562fc09eff19833de926ee2364408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The addition of a new defconfig in commit
459e3320dc234f96b93661bed1a753e477aeab17 ("configs/imx6sx-sdb: Add new
defconfig") introduced changes in the DEVELOPERS file and
.gitlab-ci.yml file that were not matching the defconfig name. This
commit fixes those issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 2 +-
 DEVELOPERS     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 747977d..c34d2f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,7 +127,7 @@ imx6-sabreauto_defconfig: *defconfig
 imx6-sabresd_defconfig: *defconfig
 imx6-sabresd_qt5_defconfig: *defconfig
 imx6slevk_defconfig: *defconfig
-imx6sxsdb_defconfig: *defconfig
+imx6sx-sdb_defconfig: *defconfig
 imx6ulevk_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 19a9f2d..e4aeae6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -581,7 +581,7 @@ F:	board/warp7/
 F:	configs/freescale_imx*
 F:	configs/imx6-sabresd*
 F:	configs/imx6slevk_defconfig
-F:	configs/imx6sxsdb_defconfig
+F:	configs/imx6sx-sdb_defconfig
 F:	configs/imx6ulevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/mx6cubox_defconfig
