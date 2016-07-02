From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:55 +0200
Subject: [Buildroot] [PATCH 26/69] libusb-compat: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-27-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libusb-compat/libusb-compat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index a98eb0924f72..26107be86192 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -9,6 +9,7 @@ LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).5
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-$(LIBUSB_COMPAT_VERSION_MAJOR)/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
+HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 LIBUSB_COMPAT_LICENSE = LGPLv2.1+
-- 
2.1.0
