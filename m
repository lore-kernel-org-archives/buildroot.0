From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 00:05:14 +0200
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_atf:
 update U-Boot/ATF use in TestATFVexpress
Message-ID: <20200805215948.23AFE8376E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc3d6a3ed0f5f1ceda7ab64b8b2bee88abd29373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This simply updates to more modern versions of ATF and U-Boot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/boot/test_atf.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 21c3ec314e..678c13de5b 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -10,14 +10,14 @@ class TestATFVexpress(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
         BR2_TARGET_VEXPRESS_FIRMWARE=y
         """
 
