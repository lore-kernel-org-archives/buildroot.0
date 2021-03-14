From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 21:47:50 +0100
Subject: [Buildroot] [git commit] package/bluez5_utils: bump to version 5.56
Message-ID: <20210314202540.EE2C787659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41f352b3b2dbe43c841763a62d99d57e769a48eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.bluez.org/release-of-bluez-5-56/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index a2e22148ae..096745def8 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.55
+BLUEZ5_UTILS_HEADERS_VERSION = 5.56
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index d0f3b80598..9bd8022e3d 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88  bluez-5.55.tar.xz
+sha256  59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d  bluez-5.56.tar.xz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 2fd3016b50..7b3207d952 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.55
+BLUEZ5_UTILS_VERSION = 5.56
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
