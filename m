From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Feb 2020 17:03:56 -0700
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump to version
 20200122
Message-ID: <20200220000356.16733-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added new r8169 firmware files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index b7c9753955..eff0c4cbb2 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 270f4b2dd89feb6ed7d9e166bb1677f27d8f93da9d95312e6d188b0e1efaba73 linux-firmware-20190717.tar.gz
+sha256 83646c58fc4e3ee9a73f4fa74213c849109f48c719322346393f3e5b0fa55044 linux-firmware-20200122.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 ac7c42c8331ef69221039f770193a2120bc67c7bba357e51a5b3f557bca0037c LICENSE.amdgpu
 sha256 2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4 LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9d86ce57b2..fd90f261fa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20190717
+LINUX_FIRMWARE_VERSION = 20200122
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -467,6 +467,9 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
 	rtl_nic/rtl8106e-1.fw \
 	rtl_nic/rtl8106e-2.fw \
+	rtl_nic/rtl8107e-1.fw \
+	rtl_nic/rtl8107e-2.fw \
+	rtl_nic/rtl8125a-3.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \
@@ -474,6 +477,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8168e-3.fw \
 	rtl_nic/rtl8168f-1.fw \
 	rtl_nic/rtl8168f-2.fw \
+	rtl_nic/rtl8168fp-3.fw \
 	rtl_nic/rtl8168g-2.fw \
 	rtl_nic/rtl8168g-3.fw \
 	rtl_nic/rtl8168h-1.fw \
-- 
2.20.1
