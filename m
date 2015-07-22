From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 11:00:40 -0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.8.20
Message-ID: <1437573640-12144-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 19113a6..5df22ef 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7f795268efd343ff0498786acb35097564390d40b1b6158daf1b4f742b522b07  dbus-1.8.16.tar.gz
+sha256	5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a  dbus-1.8.20.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e9c9aaf..a76f24a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.16
+DBUS_VERSION = 1.8.20
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
2.3.6
