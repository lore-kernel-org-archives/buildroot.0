From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jun 2020 10:00:00 +0200
Subject: [Buildroot] [PATCH v3 7/7] configs/guest_*: use
 BR2_PACKAGE_SYSTEMD_GUEST
In-Reply-To: <20200621080000.180089-1-francois.perrad@gadz.org>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
Message-ID: <20200621080000.180089-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/guest_arm_a7_defconfig | 13 +++++++++++++
 configs/guest_arm_a9_defconfig | 13 +++++++++++++
 configs/guest_x86_64_defconfig | 13 +++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/configs/guest_arm_a7_defconfig b/configs/guest_arm_a7_defconfig
index efe9a1369..2a9081edf 100644
--- a/configs/guest_arm_a7_defconfig
+++ b/configs/guest_arm_a7_defconfig
@@ -11,6 +11,19 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 # System
 BR2_INIT_SYSTEMD=y
 # BR2_TARGET_GENERIC_GETTY is not set
+# BR2_TARGET_TZ_INFO is not set
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
+
+# Packages
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_KMOD is not set
+BR2_PACKAGE_SYSTEMD_GUEST=y
+# BR2_PACKAGE_SYSTEMD_PSTORE is not set
+# BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
+# BR2_PACKAGE_SYSTEMD_HWDB is not set
+# BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
+# BR2_PACKAGE_SYSTEMD_NETWORKD is not set
+# BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
+# BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
diff --git a/configs/guest_arm_a9_defconfig b/configs/guest_arm_a9_defconfig
index 02c3d302d..2d19a31cd 100644
--- a/configs/guest_arm_a9_defconfig
+++ b/configs/guest_arm_a9_defconfig
@@ -13,6 +13,19 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 # System
 BR2_INIT_SYSTEMD=y
 # BR2_TARGET_GENERIC_GETTY is not set
+# BR2_TARGET_TZ_INFO is not set
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
+
+# Packages
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_KMOD is not set
+BR2_PACKAGE_SYSTEMD_GUEST=y
+# BR2_PACKAGE_SYSTEMD_PSTORE is not set
+# BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
+# BR2_PACKAGE_SYSTEMD_HWDB is not set
+# BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
+# BR2_PACKAGE_SYSTEMD_NETWORKD is not set
+# BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
+# BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
diff --git a/configs/guest_x86_64_defconfig b/configs/guest_x86_64_defconfig
index 42d1d659a..4e19d23e5 100644
--- a/configs/guest_x86_64_defconfig
+++ b/configs/guest_x86_64_defconfig
@@ -10,6 +10,19 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 # System
 BR2_INIT_SYSTEMD=y
 # BR2_TARGET_GENERIC_GETTY is not set
+# BR2_TARGET_TZ_INFO is not set
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
+
+# Packages
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_KMOD is not set
+BR2_PACKAGE_SYSTEMD_GUEST=y
+# BR2_PACKAGE_SYSTEMD_PSTORE is not set
+# BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
+# BR2_PACKAGE_SYSTEMD_HWDB is not set
+# BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
+# BR2_PACKAGE_SYSTEMD_NETWORKD is not set
+# BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
+# BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
-- 
2.25.1
