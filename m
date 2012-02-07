From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue,  7 Feb 2012 12:01:26 +0100
Subject: [Buildroot] [PATCHv2 2/2] Add lpc3250loader to lpc3250 configs
In-Reply-To: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
References: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <1328612486-7770-2-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 configs/ea3250_defconfig  |    6 ++++++
 configs/fdi3250_defconfig |    6 ++++++
 configs/phy3250_defconfig |    6 ++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
index da84c7e..9cd7b34 100644
--- a/configs/ea3250_defconfig
+++ b/configs/ea3250_defconfig
@@ -12,6 +12,12 @@ BR2_ARM_EABI=y
 BR2_GCC_VERSION_4_3_X=y
 
 
+#
+# Host utilities
+#
+BR2_PACKAGE_HOST_LPC3250LOADER=y
+
+
 # Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="ea3250"
diff --git a/configs/fdi3250_defconfig b/configs/fdi3250_defconfig
index 505dc8b..1fd0b05 100644
--- a/configs/fdi3250_defconfig
+++ b/configs/fdi3250_defconfig
@@ -12,6 +12,12 @@ BR2_ARM_EABI=y
 BR2_GCC_VERSION_4_3_X=y
 
 
+#
+# Host utilities
+#
+BR2_PACKAGE_HOST_LPC3250LOADER=y
+
+
 # Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="fdi3250"
diff --git a/configs/phy3250_defconfig b/configs/phy3250_defconfig
index d46d719..bc17d5c 100644
--- a/configs/phy3250_defconfig
+++ b/configs/phy3250_defconfig
@@ -12,6 +12,12 @@ BR2_ARM_EABI=y
 BR2_GCC_VERSION_4_3_X=y
 
 
+#
+# Host utilities
+#
+BR2_PACKAGE_HOST_LPC3250LOADER=y
+
+
 # Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="phy3250"
-- 
1.7.5.4
