From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:50:10 +0200
Subject: [Buildroot] [git commit] configs/acmesystems*: drop
 BR2_TARGET_ROOTFS_EXT2_LABEL options
Message-ID: <20200415203641.684208ED92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75fd330a5434f4db33c03a86df9c2d55d7ade7a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_ROOTFS_EXT2_LABEL now defaults to "rootfs", so repeating
that in those defconfigs is no longer necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig    | 1 -
 configs/acmesystems_aria_g25_256mb_defconfig    | 1 -
 configs/acmesystems_arietta_g25_128mb_defconfig | 1 -
 configs/acmesystems_arietta_g25_256mb_defconfig | 1 -
 4 files changed, 4 deletions(-)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index 4f8f4d5406..cf62b5b72e 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
 # AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 4569a7b7aa..496ccd6853 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
 # AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index 0174f356da..17ef7e757c 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
 # AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index 14e4dd00be..aa0236bbb3 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
 
 # AT91bootstrap bootloader
 BR2_TARGET_AT91BOOTSTRAP3=y
