From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Sep 2012 22:08:39 +0200
Subject: [Buildroot] [git commit] configs/calao_*: defconfigs should not
	hardcode BR2_JLEVEL
Message-ID: <20120929201755.448CB9975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81b3d1f4f1799523cecb0fb94f707a0754180f25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_JLEVEL is specific to the build machine, not the specific board you
are targetting.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/calao_usb_a9263_defconfig     |    1 -
 configs/calao_usb_a9g20_lpw_defconfig |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
index 6612d2c..65263cf 100644
--- a/configs/calao_usb_a9263_defconfig
+++ b/configs/calao_usb_a9263_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_JLEVEL=2
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index 580972a..e3d9cf5 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_JLEVEL=2
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
