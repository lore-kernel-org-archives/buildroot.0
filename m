From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 08:43:43 +0100
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump to version
	20131113
Message-ID: <20140116081738.38CFD9C013@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0469ab88354cb18a4379ed14411bfefcc923aa00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

20131113:
    Added devices: Quanta 1KR / USB-lte 7410, Quanta MobileGenie 4G lte,
    AVM Fritz!Wlan USB N v2, Alcatel-sbell ASB TL131 TD-LTE, Vodafone K4305,
    K5150, K4201, K4202 and K4606; ZTE MF821D (Variant), ZTE MF70, ZTE MF60,
    Haier EVDO Rev. A; several cleanups and fixes. Special thanks to Lars
    Melin for many device contributions and corrections!

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index c7dc951..9aa0dc4 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20130807
+USB_MODESWITCH_DATA_VERSION = 20131113
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
