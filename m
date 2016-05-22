From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 11:57:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/bluez5_utils: remove autoreconf
Message-ID: <1463911064-8854-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-Link-mcaptest-with-lrt.patch was removed 2016-01-05:
https://git.busybox.net/buildroot/commit/package/bluez5_utils?id=e2274856123fcc387df95675d7a66eb2c576eaa2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/bluez5_utils.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 659f05d..ddc8c45 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,9 +12,6 @@ BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
-# 0001-Link-mcaptest-with-lrt.patch
-BLUEZ5_UTILS_AUTORECONF = YES
-
 BLUEZ5_UTILS_CONF_OPTS = 	\
 	--enable-tools 		\
 	--enable-library 	\
-- 
2.8.1
