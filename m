From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 17:36:47 +0100
Subject: [Buildroot] [git commit] configs/nitrogen8m*: new uboot requires
 host ssl
Message-ID: <20210102161913.CAAB785B96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dcddac36012265a6206d2e11b55ea73d181682e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: 8f75e63ec4 ("configs/nitrogen*: bump u-boot to version 2020.10")
https://gitlab.com/buildroot.org/buildroot/-/jobs/938922366
https://gitlab.com/buildroot.org/buildroot/-/jobs/938922367
https://gitlab.com/buildroot.org/buildroot/-/jobs/938922368

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8m_defconfig  | 1 +
 configs/nitrogen8mm_defconfig | 1 +
 configs/nitrogen8mn_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 7445d32c11..0aa913aa54 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Kernel
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 8692e527b7..1767490d8b 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Kernel
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index a160234d61..cd5c4d928d 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Kernel
