From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 18:50:01 +0200
Subject: [Buildroot] [git commit] package/usbutils: bump to version 006
Message-ID: <20120718170623.3E43A96B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3a91caccbfa6e2adcb134f8f2f457aef4a27786
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, as the kernel.org archives are back up, use them as official site
again.

[thomas.petazzoni at free-electrons.com: use BR2_KERNEL_MIRROR]

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usbutils/usbutils.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 53a29c5..6e29571 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 005
-USBUTILS_SITE = http://snapshot.debian.org/archive/debian/20111211T214105Z/pool/main/u/usbutils/
-USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
+USBUTILS_VERSION = 006
+USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils/
+USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
 # no configure in tarball
