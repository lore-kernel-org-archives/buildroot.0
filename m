From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 21 Jun 2011 13:15:04 +0200
Subject: [Buildroot] [git commit] usbutils: bump to 003
Message-ID: <20110621111612.483EC873F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e46df26e11a790da253de2d4c8ae99b4768b684a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbutils/usbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index a034ddc..1ddadbe 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 002
+USBUTILS_VERSION = 003
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
-- 
1.7.3.4
