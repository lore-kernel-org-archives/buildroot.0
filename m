From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:55:06 +0200
Subject: [Buildroot] [git commit] pandaboard: remove use of gcc 4.6.x
Message-ID: <20140717185514.101749CFF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d76e731a6bc0c23e9f395a1817d226d7742d2ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gcc 4.6.x is legacy now; remove version specification from the config file to
repair the build.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/pandaboard_defconfig |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 401a602..50c3714 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -28,9 +28,6 @@ BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 # might need omap4-panda or omap4-panda-a4 instead
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
 
-# GCC
-BR2_GCC_VERSION_4_6_X=y
-
 # Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
