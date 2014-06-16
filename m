From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 08:28:27 -0300
Subject: [Buildroot] [PATCH] libusb: bump to version 1.0.19
Message-ID: <1402918107-10225-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libusb/libusb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 417b2ce..7e0f877 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).18
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).19
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
-- 
1.8.5.5
