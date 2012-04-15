From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 11:22:48 +0200
Subject: [Buildroot] [git commit] Add sam-ba to at91sam926*_defconfig
Message-ID: <20120415120358.409D996ABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9eee902c010f8bd464e66b32ff073b5e8c66fb09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also add to 9g0dfc]
Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9260dfc_defconfig |    4 ++++
 configs/at91sam9261ek_defconfig  |    4 ++++
 configs/at91sam9263ek_defconfig  |    4 ++++
 configs/at91sam9g20dfc_defconfig |    4 ++++
 4 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 3cd58ac..921afa8 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Host utilities
+#
+BR2_PACKAGE_HOST_SAM_BA=y
+
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 73edd89..aafb166 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Host utilities
+#
+BR2_PACKAGE_HOST_SAM_BA=y
+
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9261ek"
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index e4a44f1..2cd82c0 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Host utilities
+#
+BR2_PACKAGE_HOST_SAM_BA=y
+
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9263ek"
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 4a4b09c..723b9e1 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Host utilities
+#
+BR2_PACKAGE_HOST_SAM_BA=y
+
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9g20ek"
