From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 22:50:17 +0200
Subject: [Buildroot] [git commit branch/next] beaglebone: add am33x-cm3 to
	the build
Message-ID: <20130514205254.B70709A1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0399249b76bc02e4cb1cad2edc3812f4f992ce7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the FW needed for the Cortex M3 on the beaglebone. This is required
for working power management.

Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/beaglebone_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 38a63a1..a141320 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,6 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 
 # filesystem
+BR2_PACKAGE_AM33X_CM3=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
