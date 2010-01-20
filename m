From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 11:10:32 +0100
Subject: [Buildroot] [git commit master] Bump usb_modeswitch to 1.0.7
Message-ID: <20100120101207.F0578776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c95e3b848141e90b26324e9a7c117e746d702ec7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #919.

Includes new device signatures, improved handling of Huawei devices
and other fixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    5 +++--
 package/usb_modeswitch/usb_modeswitch.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b7fdf01..32c9f8e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot, usbutils,
-	xfsprogs
+	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot,
+	usb_modeswitch, usbutils, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -32,6 +32,7 @@
 	#827: Bump mtd-utils package to version 1.2.0
 	#841: Build error
 	#913: Bump iptables to 1.4.6
+	#919: Bump usb_modeswitch package to 1.0.7
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index fc5d2f6..306d803 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USB_MODESWITCH_VERSION = 1.0.5
+USB_MODESWITCH_VERSION = 1.0.7
 USB_MODESWITCH_SOURCE = usb_modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-- 
1.6.3.3
