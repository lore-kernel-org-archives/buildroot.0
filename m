From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:04:04 +0100
Subject: [Buildroot] [git commit] configs/odroidc2: bump uboot version to
	eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c
Message-ID: <20170206130440.19B7781F87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae5af87e61d961287f6ff0c0ccbda97ce0092476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this version bump allows usage of hardkernel's secure signatures when
booting a system

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 95a9169..ecee2ad 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ec799cec97574a9838bc25b286484e579a41652"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c"
 BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
 
 # Required tools to create the SD image
