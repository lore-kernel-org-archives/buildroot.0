From: Daniel Mack <zonque@gmail.com>
Date: Wed, 7 Sep 2011 21:34:48 +0200
Subject: [Buildroot] [git commit] dbus: bump version to 1.4.14
Message-ID: <20110907194909.79FB88D48B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60b9bbfca9af488db9dc561ae2b1d186809893d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7c2bddd..d276b72 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.10
+DBUS_VERSION = 1.4.14
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
-- 
1.7.3.4
