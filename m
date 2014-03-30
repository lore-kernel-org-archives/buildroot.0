From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 30 Mar 2014 07:22:51 -0300
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch_data: bump to version
	20140327
In-Reply-To: <1396174971-21627-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396174971-21627-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1396174971-21627-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 537edd7..4806d5c 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20140129
+USB_MODESWITCH_DATA_VERSION = 20140327
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
1.8.3.2
