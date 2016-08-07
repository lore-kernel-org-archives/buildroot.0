From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:52:15 +0200
Subject: [Buildroot] [git commit] defconfigs/kb9202: fix headers version
Message-ID: <20160807205309.ADD61817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b1d1b6f2d48b1782ac8eea588fabd1e63b92b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/150333697

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/kb9202_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index c38adbf..0aea0eb 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -5,7 +5,8 @@ BR2_arm920t=y
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
 
-# Linux headers same as kernel, a 2.6 series (so, no option selected)
+# Linux headers same as kernel, a 2.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
