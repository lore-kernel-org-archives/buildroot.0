From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 12:03:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/usbutils: bump to version 013
Message-ID: <20201213110306.750629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/gregkh/usbutils/blob/v013/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbutils/usbutils.hash | 6 +++---
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 4404913193..96426aeea2 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256	88634625f91840bc1993d2731cc081ee8d3b13d56069a95bdd6ac6ef0e063e46	usbutils-012.tar.xz
+sha256  9e23494fcc78b7a80ee29a07dd179c95ae2f71509c35728dbbabc2d1cca41338  usbutils-013.tar.xz
 # Locally calculated
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSES/GPL-2.0.txt
-sha256	3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986	LICENSES/GPL-3.0.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0.txt
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 2389386e50..ef5fd12013 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 012
+USBUTILS_VERSION = 013
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-- 
2.29.2
