From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 13:34:11 -0000
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 2.1.0
Message-ID: <20140228133410.362BC9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de32f1e129fcdfbff56e916a52ee218b7fbd0d7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.1.0, 2014/01/28
    ATTENTION: -I flag meaning reversed, default is to skip SCSI inquiry;
    introduction of StandardEject, replacing many MessageContents with the
    same function, reducing size of device config files, and always including
    the 'Allow Medium Removal' before ejecting (thanks to Lars Melin for
    the idea); fix in "bulk_read", removing bogus CSW request (report from
    "Sonya at zte")

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 87afe9f..5d3bace 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.0.1
+USB_MODESWITCH_VERSION = 2.1.0
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
