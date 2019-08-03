From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 14:31:08 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add raspberrypi4_defconfig
Message-ID: <20190803122825.A33FE814C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33604017a61d3511b3fc77bb21aab79e5131d9f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fa1ce849f3061fab282aa78ebff3cc30abb08f4f added raspberrypi4_defconfig
but forgot to update .gitlab-ci.yml.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b7d1ab7f32..3f2284d15f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -298,6 +298,7 @@ raspberrypi2_defconfig: { extends: .defconfig }
 raspberrypi3_64_defconfig: { extends: .defconfig }
 raspberrypi3_defconfig: { extends: .defconfig }
 raspberrypi3_qt5we_defconfig: { extends: .defconfig }
+raspberrypi4_defconfig: { extends: .defconfig }
 raspberrypi_defconfig: { extends: .defconfig }
 riotboard_defconfig: { extends: .defconfig }
 rock64_defconfig: { extends: .defconfig }
