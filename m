From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Feb 2014 12:46:18 +0100
Subject: [Buildroot] [PATCH 1/2] dbus: bump version to 1.6.8
Message-ID: <1391514379-7431-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Gary Coulbourne <bear@bears.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 560f63e..74e2041 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.4.26
+DBUS_VERSION = 1.6.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
1.8.5.3
