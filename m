From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Wed, 11 Apr 2012 15:06:50 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
Message-ID: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 configs/at91sam9260dfc_defconfig |    4 ++++
 configs/at91sam9261ek_defconfig  |    5 +++++
 configs/at91sam9263ek_defconfig  |    4 ++++
 3 files changed, 13 insertions(+), 0 deletions(-)

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
index 73edd89..b801bbe 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -2,6 +2,11 @@
 BR2_arm=y
 BR2_arm926t=y
 
+
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
-- 
1.7.5.4
