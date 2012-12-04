From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Dec 2012 15:13:22 -0300
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch_data: bump to version
	20121109
In-Reply-To: <1354644802-28286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354644802-28286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354644802-28286-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a7b7072..479137c 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USB_MODESWITCH_DATA_VERSION = 20120815
+USB_MODESWITCH_DATA_VERSION = 20121109
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
1.7.8.6
