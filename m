From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 20:09:34 +0200
Subject: [Buildroot] [PATCH 3/3] package/libmodbus: bump version to 3.0.6
In-Reply-To: <1429466974-12546-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429466974-12546-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429466974-12546-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmodbus/libmodbus.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 5073df6..cf37359 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.0.5
+LIBMODBUS_VERSION = 3.0.6
 LIBMODBUS_SITE = http://libmodbus.org/site_media/build
 LIBMODBUS_LICENSE = LGPLv2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
-- 
1.7.10.4
