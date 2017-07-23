From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 15:54:32 +0200
Subject: [Buildroot] [git commit] configs/nanopi_m1_*: bump to final u-boot
	2017.07
Message-ID: <20170723135100.5A7EC81DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a57484ac383813b8d0e5c05b07434361ed82045e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nanopi_m1_defconfig      | 2 +-
 configs/nanopi_m1_plus_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index d00a9b8..23a5e60 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index e76bc05..a1ae00e 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1 Plus"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc3"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
