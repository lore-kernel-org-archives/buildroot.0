From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Jun 2013 10:50:24 -0300
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.4.26
Message-ID: <1372168224-17272-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-2168.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index cb72f1f..a855f05 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.4.24
-DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_VERSION = 1.4.26
+DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
-- 
1.8.1.5
