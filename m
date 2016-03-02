From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Mar 2016 20:27:53 -0000
Subject: [Buildroot] [git commit] usb-modeswitch: bump to version 2.3.0
Message-ID: <20160302202751.A0A4D80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c06a0f50d6cfdf87dd7baf7fb97d7b6a1ca5c30d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.hash | 2 +-
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 2033d31..075ef63 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7ee42be2fe26dde20c58f54bf678fb136d2706250e4aa74f06fc97268a46e90f	usb-modeswitch-2.2.6.tar.bz2
+sha256	f93e940c2eb0c585a5d2210177338e68a9b24f409e351e4a854132453246b894	usb-modeswitch-2.3.0.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index aca13e4..ac41a80 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.6
+USB_MODESWITCH_VERSION = 2.3.0
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
