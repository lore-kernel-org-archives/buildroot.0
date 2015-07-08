From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:51:38 +0200
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 2.2.3
Message-ID: <20150708215408.7396281913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4ec5baec7ac9c50ac08038239710bccf4078928
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.hash |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index bfe1f59..1e8df22 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	37d926a0b6b6d490173c57e260a69aca49feb774875fc8f2001c1d0f5e8011cb	usb-modeswitch-2.2.1.tar.bz2
+sha256	d1a0d9a9e7411f07796611881a8f264daa946e2a28418abed34639b3583d7593	usb-modeswitch-2.2.3.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 9c16416..0a2b8db 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.1
+USB_MODESWITCH_VERSION = 2.2.3
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
