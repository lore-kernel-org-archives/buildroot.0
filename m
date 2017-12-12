From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 01:51:57 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: refresh after ATF tests
 addition
Message-ID: <20171212004519.7847180FED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9e3343c3e4ead4b6a6acbc562c56432fc6da71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/44094313

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f9a7f78..03c0401 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -231,6 +231,9 @@ zynq_microzed_defconfig: *defconfig
 zynq_zc706_defconfig: *defconfig
 zynq_zed_defconfig: *defconfig
 zynq_zybo_defconfig: *defconfig
+tests.boot.test_atf.TestATFAllwinner: *runtime_test
+tests.boot.test_atf.TestATFMarvell: *runtime_test
+tests.boot.test_atf.TestATFVexpress: *runtime_test
 tests.core.test_post_scripts.TestPostScripts: *runtime_test
 tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
 tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
