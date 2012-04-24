From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 22:08:48 +0200
Subject: [Buildroot] [git commit] dbus: bump to 1.4.20
Message-ID: <20120424203537.735BA96BB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3515019934d1d5d36b2b2189d38b27fb727c25a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dbus/dbus.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0942b33..7e72e3d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,8 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.16
-DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
+DBUS_VERSION = 1.4.20
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
 
