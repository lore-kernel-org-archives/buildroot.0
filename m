From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:49:01 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update after adding
	raspberrypi3_qt5we_defconfig
Message-ID: <20170926215333.CB17581099@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73dba11172dd536ffae68e1fd4cd1b5c9fc005c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 21234ce8 introduced raspberrypi3_qt5we_defconfig but didn't
update .gitlab-ci.yml. Do that now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1d1e7bd..3129542 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -190,6 +190,7 @@ raspberrypi0_defconfig: *defconfig
 raspberrypi2_defconfig: *defconfig
 raspberrypi3_64_defconfig: *defconfig
 raspberrypi3_defconfig: *defconfig
+raspberrypi3_qt5we_defconfig: *defconfig
 raspberrypi_defconfig: *defconfig
 riotboard_defconfig: *defconfig
 roseapplepi_defconfig: *defconfig
