From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:04 +0200
Subject: [Buildroot] [PATCH 5/6] package/libphidget: fix upstream source URL
In-Reply-To: <20170829191005.19697-1-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
Message-ID: <20170829191005.19697-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libphidget/libphidget.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index 23a320b07..803d5012a 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -6,7 +6,7 @@
 
 LIBPHIDGET_VERSION = 2.1.8.20140319
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries
+LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
-- 
2.11.0
