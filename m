From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:38:44 +0200
Subject: [Buildroot] [git commit] dbus: bump version to 1.10.22
Message-ID: <20170728223914.C5F3D82122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29f0bd345bde90fcf0060c33623ade34fa9c288c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 3c45de2..b005242 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.20.tar.gz.asc
-sha256	e574b9780b5425fde4d973bb596e7ea0f09e00fe2edd662da9016e976c460b48  dbus-1.10.20.tar.gz
+# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.22.tar.gz.asc
+sha256	e2b1401e3eedc7b5c9a2034d31254c886e1fcbc7858006e0a1c59158fe4b7b97  dbus-1.10.22.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b794db4..1e3b462 100644
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
