From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jun 2012 09:02:52 +0200
Subject: [Buildroot] [PATCH] libmodbus: bump to 3.0.3
Message-ID: <1338879772-6717-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmodbus/libmodbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4dcfe23..d45bc92 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -3,9 +3,8 @@
 # libmodbus
 #
 #############################################################
-LIBMODBUS_VERSION = 3.0.2
+LIBMODBUS_VERSION = 3.0.3
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
-LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
 LIBMODBUS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.7
