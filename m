From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Dec 2011 23:12:05 +0100
Subject: [Buildroot] [git commit] dbus-glib: bump to version 0.98
Message-ID: <20111201221238.DC9CC8F72B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2dda9ea0d31d30c990a2cb76b764e80c4ed06ca3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
