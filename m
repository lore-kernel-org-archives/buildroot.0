From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 11:18:08 +0200
Subject: [Buildroot] [PATCH 2/5] Update defconfigs after DHCP option rename
In-Reply-To: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279271862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <74dde6e0836695c3d80c0635c3b0b0993ef12c30.1279271863.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    2 +-
 configs/at91rm9200df_ext_bare_defconfig   |    2 +-
 configs/at91sam9260dfc_ext_bare_defconfig |    2 +-
 configs/at91sam9260pf_defconfig           |    2 +-
 configs/at91sam9261ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9263ek_ext_bare_defconfig  |    2 +-
 configs/at91sam9g20dfc_ext_bare_defconfig |    2 +-
 configs/atstk100x_defconfig               |    2 +-
 configs/kb9202_defconfig                  |    2 +-
 configs/v100sc2_defconfig                 |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 4c1e2c2..3062541 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -408,7 +408,7 @@ BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 1622cc7..fec2c04 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -329,7 +329,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index f1939cc..540eef6 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -329,7 +329,7 @@ BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index d444158..d83bb8c 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -330,7 +330,7 @@ BR2_NETWORK_SUPPORT=y
 # BR2_PACKAGE_BRIDGE is not set
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
-BR2_PACKAGE_ISC_DHCP=y
+BR2_PACKAGE_DHCP=y
 # BR2_PACKAGE_DHCP_SERVER is not set
 # BR2_PACKAGE_DHCP_RELAY is not set
 BR2_PACKAGE_DHCP_CLIENT=y
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index e116f44..ab8851f 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -332,7 +332,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 4efc758..2578b95 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -331,7 +331,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 22676b7..49a5124 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -329,7 +329,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 0a718de..da58c26 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -376,7 +376,7 @@ BR2_PACKAGE_AVAHI_AUTOIPD=y
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
 # BR2_PACKAGE_BRIDGE is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 9300f28..f2dddb7 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -360,7 +360,7 @@ BR2_NETWORK_SUPPORT=y
 # BR2_PACKAGE_BRIDGE is not set
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 # BR2_PACKAGE_DROPBEAR is not set
 # BR2_PACKAGE_ETHTOOL is not set
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index c85a4d8..17a627e 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -335,7 +335,7 @@ BR2_NETWORK_SUPPORT=y
 # BR2_PACKAGE_BRIDGE is not set
 # BR2_PACKAGE_CURL is not set
 # BR2_PACKAGE_LIBCURL is not set
-# BR2_PACKAGE_ISC_DHCP is not set
+# BR2_PACKAGE_DHCP is not set
 # BR2_PACKAGE_DNSMASQ is not set
 BR2_PACKAGE_DROPBEAR=y
 # BR2_PACKAGE_ETHTOOL is not set
-- 
1.7.0.4
