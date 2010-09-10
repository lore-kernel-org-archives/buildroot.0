From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Sep 2010 13:21:06 +0200
Subject: [Buildroot] [git commit master 1/1] usbutils: bump to 0.90
Message-ID: <20100910112128.57B0A8A5F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=33070528796dafe90ebab836356fea03f2dc24f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/usbutils/usbutils.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9d1677a..70459d2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	misc fixes + nconfig and savedefconfig targets.
 
 	Updated/fixed packages: berkeleydb, busybox, dropbear,
-	iptables, kismet, openvpn, qt
+	iptables, kismet, openvpn, qt, usbutils
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index f095297..0f82128 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.87
+USBUTILS_VERSION = 0.90
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
-- 
1.7.1
