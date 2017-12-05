From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Dec 2017 20:36:52 +0200
Subject: [Buildroot] [PATCH] usbutils: bump to version 009
Message-ID: <18a8b28aa2354258b8330aaa7541f0f5a8e60e0e.1512499012.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/usbutils/usbutils.hash | 2 +-
 package/usbutils/usbutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 37c829a1ae41..4e55c9b10144 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
-sha256	44741af0bae9d402a0ef160a29b2fa700bb656ab5e0a4b3343d51249c2a44c8c	usbutils-008.tar.xz
+sha256	8bbff0e54cb5f65a52be4feb9162fc0b022a97eb841b44784f7a89a9ea567160	usbutils-009.tar.xz
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index c397d0adc73b..84702ebc1f91 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBUTILS_VERSION = 008
+USBUTILS_VERSION = 009
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-- 
2.15.0
