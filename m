From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  7 Feb 2012 10:18:30 +0100
Subject: [Buildroot] [PATCH] libmodbus: bump to 3.0.2
Message-ID: <1328606310-10214-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmodbus/libmodbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index ab134fd..4dcfe23 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -3,7 +3,7 @@
 # libmodbus
 #
 #############################################################
-LIBMODBUS_VERSION = 3.0.1
+LIBMODBUS_VERSION = 3.0.2
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
 LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
 LIBMODBUS_INSTALL_STAGING = YES
-- 
1.7.1.1
