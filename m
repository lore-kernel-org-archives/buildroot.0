From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 09:42:15 +0200
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump to version
	20130807
Message-ID: <20130912080443.1323A9B725@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cdbe8f30f4cb89c5b3aea44bf3f373231d573e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a9ce006..10a3902 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20130610
+USB_MODESWITCH_DATA_VERSION = 20130807
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
