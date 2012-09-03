From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Sep 2012 22:32:27 +0200
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump version
Message-ID: <20120903203827.EDCA699535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=539437041c4c9bccce741ae209d28301a838657f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous version is no longer available upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index d493144..a7b7072 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USB_MODESWITCH_DATA_VERSION = 20120812
+USB_MODESWITCH_DATA_VERSION = 20120815
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
