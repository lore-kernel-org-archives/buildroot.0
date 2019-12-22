From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 12:06:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/usb_modeswitch_data: bump to
 version 20191128
In-Reply-To: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
References: <20191222110646.2201048-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222110646.2201048-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usb_modeswitch_data/usb_modeswitch_data.hash | 2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index f35fd69a8b..d2518e32d9 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c  usb-modeswitch-data-20170806.tar.bz2
+sha256	3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9  usb-modeswitch-data-20191128.tar.bz2
 sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 80ecd33d85..a3a98ad7e7 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20170806
+USB_MODESWITCH_DATA_VERSION = 20191128
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
2.24.0
