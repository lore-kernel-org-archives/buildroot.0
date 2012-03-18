From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 15:42:42 +0100
Subject: [Buildroot] [git commit] Add lpc3250loader to lpc3250 configs
Message-ID: <20120318144249.3C76190D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8991218447dabd885359c3880de205d408e47d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
