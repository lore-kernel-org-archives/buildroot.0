From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:06 -0000
Subject: [Buildroot] [git commit branch/next] usb_modeswitch: bump to
	version 2.2.5
Message-ID: <20150808105636.589307FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9360f9183f8cc4b18d28e81c527eb93e5990f87e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch/usb_modeswitch.hash |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 089dd6e..9552a24 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	096da0eb492a872b091c658cc03c0471b3f0b6afbb86d606582b61fcb37de29b	usb-modeswitch-2.2.4.tar.bz2
+sha256	8b2340303732aabc8c8e1cdd7d4352f61dcb942839f58ce22ba0ecfa122426d5	usb-modeswitch-2.2.5.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index fd1e1f7..c1b0a76 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.4
+USB_MODESWITCH_VERSION = 2.2.5
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
