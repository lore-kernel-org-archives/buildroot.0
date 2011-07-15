From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 15 Jul 2011 22:58:38 +0200
Subject: [Buildroot] [git commit] dbus-glib: update to version 0.94
Message-ID: <20110715223019.BDD1D8A5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d5f6c2cfbc2f0b48704fe99a5b618a594033f80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
