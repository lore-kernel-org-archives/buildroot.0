From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 00:59:32 +0200
Subject: [Buildroot] [git commit master 1/1] dbus: bump to 1.2.24
Message-ID: <20100925225945.969B48B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc833e7c9cd6354f0935a1533c60ff36076dafa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 141cf69..546cb69 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.2.16
+DBUS_VERSION = 1.2.24
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
-- 
1.7.1
