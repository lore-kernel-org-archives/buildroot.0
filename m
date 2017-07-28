From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 28 Jul 2017 08:50:26 -0400
Subject: [Buildroot] [PATCH 1/1] dbus: bump version to 1.10.22
Message-ID: <20170728125026.21684-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 3c45de2a9..b0052422c 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.20.tar.gz.asc
-sha256	e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48  dbus-1.10.20.tar.gz
+# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.22.tar.gz.asc
+sha256	e2b1401e3eedc7b5c9a2034d31254c886e1fcbc7858006e0a1c59158fe4b7b97  dbus-1.10.22.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b794db455..1e3b46229 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.20
+DBUS_VERSION = 1.10.22
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.13.3
