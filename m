From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 31 Oct 2013 14:16:44 +0100
Subject: [Buildroot] [PATCH] libmodbus: bump version and change download
	location
Message-ID: <1383225404-7782-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmodbus/libmodbus.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 8f93c2b..ef25724 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.0.3
-LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
+LIBMODBUS_VERSION = 3.0.5
+LIBMODBUS_SITE = http://libmodbus.org/site_media/build/
 LIBMODBUS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.7
