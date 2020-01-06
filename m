From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jan 2020 18:56:40 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi0w_defconfig: fix post
 script args
Message-ID: <20200106174809.A56088EE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61d7face887c8e5869e23d4a394d7e7f4f157258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ada40afb324 updated the raspberrypi*defconfigs to use
 -add-miniuart-bt-overlay instead of -add-pi3-miniuart-bt-overlay.
Update raspberrypi0w_defconfig also.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/raspberrypi0w_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index ea5856e8c0..e3c747ff6f 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -29,4 +29,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
