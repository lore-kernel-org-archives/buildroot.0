From: Daniel Mack <zonque@gmail.com>
Date: Thu,  1 Dec 2011 18:02:37 +0100
Subject: [Buildroot] [PATCH 2/2] dbus-glib: bump to version 0.98
In-Reply-To: <1322758957-8248-1-git-send-email-zonque@gmail.com>
References: <1322758957-8248-1-git-send-email-zonque@gmail.com>
Message-ID: <1322758957-8248-2-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/dbus-glib/dbus-glib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 8717f63..397996e 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -3,7 +3,7 @@
 # dbus-glib
 #
 #############################################################
-DBUS_GLIB_VERSION = 0.94
+DBUS_GLIB_VERSION = 0.98
 DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
 DBUS_GLIB_INSTALL_STAGING = YES
-- 
1.7.7.3
