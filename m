From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:50 +0530
Subject: [Buildroot] [PATCH 1/6] dbus-glib: fix legal info
Message-ID: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dbus glib bindings are dual licensed under AFLv2.1 or GPLv2+.
Separate licenses using 'or' keyword.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/dbus-glib/dbus-glib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 4a1e4b4..5a6f5a0 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,7 +7,7 @@
 DBUS_GLIB_VERSION = 0.108
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
-DBUS_GLIB_LICENSE = AFLv2.1, GPLv2+
+DBUS_GLIB_LICENSE = AFLv2.1 or GPLv2+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = \
-- 
2.6.2
