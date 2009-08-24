From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] Update dbus to version 1.2.16
Message-ID: <20090824202956.F24A0775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3de4ce5b32758cc35a443afff0728316d31fd953
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
 package/dbus/dbus.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7326b41..dd11677 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,9 +3,10 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.2.12
+DBUS_VERSION = 1.2.16
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
 ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
1.6.3.3
