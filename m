From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:51:45 +0200
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump to version
	20150627
Message-ID: <20150708215408.7E8A481913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba67b27350c8e9c7e4264196bb02bf311b69544b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../usb_modeswitch_data/usb_modeswitch_data.hash   |    2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 2ccb3fc..ea36839 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	90549f589835a68279369c3dc0d47eb7338ee3bad09d737e7b85e1ab15bd2d8b	usb-modeswitch-data-20150115.tar.bz2
+sha256	826096cb35a487c6e924b1318074988457220b5e72812e5393597950dd9eefc2	usb-modeswitch-data-20150627.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 01b0614..1b397cb 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20150115
+USB_MODESWITCH_DATA_VERSION = 20150627
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
