From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  8 Feb 2018 17:15:09 -0200
Subject: [Buildroot] [PATCH NEXT] usb_modeswitch_data: bump to version
 20170806
Message-ID: <20180208191509.16907-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash for "make legal-info".

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/usb_modeswitch_data/usb_modeswitch_data.hash | 3 ++-
 package/usb_modeswitch_data/usb_modeswitch_data.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index e19fcac628..f35fd69a8b 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1	usb-modeswitch-data-20170205.tar.bz2
+sha256	ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c  usb-modeswitch-data-20170806.tar.bz2
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 4f634cdaf4..80ecd33d85 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20170205
+USB_MODESWITCH_DATA_VERSION = 20170806
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
2.14.3
