From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:31:55 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: fix alphabetic ordering
Message-ID: <20190803083010.5340A7F966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ee72e9c4d0abd56980355c99c029f085721726f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2fabb9601b..b7d1ab7f32 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -214,9 +214,9 @@ mx6udoo_defconfig: { extends: .defconfig }
 nanopc_t4_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
-nanopi_m4_defconfig: {extends: .defconfig}
-nanopi_neo_defconfig: { extends: .defconfig }
+nanopi_m4_defconfig: { extends: .defconfig }
 nanopi_neo4_defconfig: { extends: .defconfig }
+nanopi_neo_defconfig: { extends: .defconfig }
 nexbox_a95x_defconfig: { extends: .defconfig }
 nitrogen6sx_defconfig: { extends: .defconfig }
 nitrogen6x_defconfig: { extends: .defconfig }
