From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:50 -0300
Subject: [Buildroot] [PATCH 01/10] bluez_utils: add license information
Message-ID: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bluez_utils/bluez_utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 643b1fe..89e88e7 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -11,6 +11,8 @@ BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
+BLUEZ_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
-- 
1.7.12.4
