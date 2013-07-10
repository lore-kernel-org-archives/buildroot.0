From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:45 -0700
Subject: [Buildroot] [PATCH 06/11] libusb-compat: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-6-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libusb-compat/libusb-compat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 8b4b0f6..8f2726e 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -10,6 +10,8 @@ LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-comp
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
+LIBUSB_COMPAT_LICENSE = LGPLv2.1+
+LIBUSB_COMPAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.4.1
