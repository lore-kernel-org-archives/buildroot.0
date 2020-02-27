From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 08:07:22 +0100
Subject: [Buildroot] [PATCH] configs/{at91,
 atmel}*_defconfig: move to bluez5_utils
Message-ID: <20200227070722.5477-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 61a813339af43 (package/bluez_utils: drop package) removed
bluez-utils, but forgot to update the defconfigs.  Fix them by changing to
bluez5-utils instead.

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/451176867 and many
others.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/at91sam9x5ek_dev_defconfig               | 2 +-
 configs/at91sam9x5ek_mmc_dev_defconfig           | 2 +-
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 4257dd5642..5f777fbc72 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -56,7 +56,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 2e12038544..e8246c8d50 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -59,7 +59,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index c1f39ba2ee..6b5def3c64 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -49,7 +49,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 057a86eab7..6f641280c8 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -62,7 +62,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 0d9a541d09..28efe4cc8f 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -58,7 +58,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index 97d2d6477c..1f1881f8b7 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -61,7 +61,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 41c24fe9be..71568f7497 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -59,7 +59,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 09c9de5fbd..93a5bd9299 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -62,7 +62,7 @@ BR2_PACKAGE_LIBDRM=y
 BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
 BR2_PACKAGE_DTC=y
 BR2_PACKAGE_DTC_PROGRAMS=y
-BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
 BR2_PACKAGE_BRIDGE_UTILS=y
 BR2_PACKAGE_CAN_UTILS=y
 BR2_PACKAGE_ETHTOOL=y
-- 
2.20.1
