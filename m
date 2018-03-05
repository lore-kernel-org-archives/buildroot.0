From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:17 -0000
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 2.5.2
Message-ID: <20180305200713.9D36C80FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=441008a984be06d903618447ab273c706b64ec20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash for "make legal-info".

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usb_modeswitch/usb_modeswitch.hash | 3 ++-
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index b202e6353a..3cbd370e2c 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633	usb-modeswitch-2.5.0.tar.bz2
+sha256	abffac09c87eacd78e101545967dc25af7e989745b4276756d45dbf4008a2ea6  usb-modeswitch-2.5.2.tar.bz2
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index c67d4cd583..8e6b433913 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.5.0
+USB_MODESWITCH_VERSION = 2.5.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
