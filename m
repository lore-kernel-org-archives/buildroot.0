From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 06 Feb 2014 19:50:52 +0800
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch_data: bump to version
	20140129
In-Reply-To: <1391687401.362.0.camel@phoenix>
References: <1391687401.362.0.camel@phoenix>
Message-ID: <1391687452.362.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

20140129:
    Minor bug fix in configs 19d2:0149 and 19d2:2000 (Lars Melin reported)

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 9aa0dc4..537edd7 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20131113
+USB_MODESWITCH_DATA_VERSION = 20140129
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
1.8.1.2
