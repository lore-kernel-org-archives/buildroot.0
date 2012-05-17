From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:18 +0200
Subject: [Buildroot] [PATCH v4 19/22] libusb: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-20-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libusb/libusb.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 9abfcfc..ac0f0d2 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -6,6 +6,8 @@
 LIBUSB_VERSION = 1.0.9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
+LIBUSB_LICENSE = LGPLv2.1+
+LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 
-- 
1.7.9.5
