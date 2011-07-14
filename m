From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 22:01:14 +0200
Subject: [Buildroot] [PATCH] dbus-glib: update to version 0.94
Message-ID: <1310673674-30200-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/dbus-glib/dbus-glib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index fac5f2b..6058b23 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -3,7 +3,7 @@
 # dbus-glib
 #
 #############################################################
-DBUS_GLIB_VERSION = 0.92
+DBUS_GLIB_VERSION = 0.94
 DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
 DBUS_GLIB_INSTALL_STAGING = YES
-- 
1.7.4.1
