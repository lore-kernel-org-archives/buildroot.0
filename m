From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 23:40:23 +0200
Subject: [Buildroot] [git commit] board: move nanopi-neo under friendlyarm
Message-ID: <20170618213951.7BB7680AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d479688e028f85b2472a8c6ca52aec3eb123153a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the vendor folder friendlyarm is created, move board nanopi-neo
also under vendor folder.

Signed-off-by: Chakra Divi <chakra@openedev.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/{ => friendlyarm}/nanopi-neo/boot.cmd      | 0
 board/{ => friendlyarm}/nanopi-neo/genimage.cfg  | 0
 board/{ => friendlyarm}/nanopi-neo/post-build.sh | 0
 board/{ => friendlyarm}/nanopi-neo/post-image.sh | 0
 board/{ => friendlyarm}/nanopi-neo/readme.txt    | 0
 configs/nanopi_neo_defconfig                     | 4 ++--
 6 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/nanopi-neo/boot.cmd b/board/friendlyarm/nanopi-neo/boot.cmd
similarity index 100%
rename from board/nanopi-neo/boot.cmd
rename to board/friendlyarm/nanopi-neo/boot.cmd
diff --git a/board/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
similarity index 100%
rename from board/nanopi-neo/genimage.cfg
rename to board/friendlyarm/nanopi-neo/genimage.cfg
diff --git a/board/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
similarity index 100%
rename from board/nanopi-neo/post-build.sh
rename to board/friendlyarm/nanopi-neo/post-build.sh
diff --git a/board/nanopi-neo/post-image.sh b/board/friendlyarm/nanopi-neo/post-image.sh
similarity index 100%
rename from board/nanopi-neo/post-image.sh
rename to board/friendlyarm/nanopi-neo/post-image.sh
diff --git a/board/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
similarity index 100%
rename from board/nanopi-neo/readme.txt
rename to board/friendlyarm/nanopi-neo/readme.txt
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index fbc0902..a227052 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/friendlyarm/nanopi-neo/post-image.sh"
 
 # Linux headers same as kernel, a 4.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
