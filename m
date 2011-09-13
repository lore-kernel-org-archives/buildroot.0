From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] usbutils: bump to version 004
Message-ID: <20110913214741.AAB168D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7fe77e43f1507917b7c80b040c6a978a81744a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbutils/usbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1ddadbe..7b5e47b 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 003
+USBUTILS_VERSION = 004
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb
 USBUTILS_INSTALL_STAGING = YES
-- 
1.7.3.4
