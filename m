From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 00:49:53 +0200
Subject: [Buildroot] [git commit] dbus: bump to 1.4.16
Message-ID: <20110926052650.A72DF8DA8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29903084043bb00b67a7ca1eede1bf4d564fec37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 9db8ea6..6834fee 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,11 +3,10 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.14
+DBUS_VERSION = 1.4.16
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
-DBUS_INSTALL_TARGET = YES
 
 DBUS_DEPENDENCIES = host-pkg-config
 
