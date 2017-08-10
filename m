From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 10 Aug 2017 15:47:02 +0200
Subject: [Buildroot] [PATCH/2017.02.x 1/2] dbus: bump version to 1.10.22
Message-ID: <1502372823-31706-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 29f0bd345bde90fcf0060c33623ade34fa9c288c)
Change site to https to avoid a redirection.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/dbus/dbus.hash | 3 ++-
 package/dbus/dbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index af8143d..b005242 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	a7b0ba6ea3e8d0e08afec5e3030d0245614268276620c536726f8fa6e5c43388  dbus-1.10.16.tar.gz
+# http://dbus.freedesktop.org/releases/dbus/dbus-1.10.22.tar.gz.asc
+sha256	e2b1401e3eedc7b5c9a2034d31254c886e1fcbc7858006e0a1c59158fe4b7b97  dbus-1.10.22.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 66b90bc..e05fbff 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.16
-DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
+DBUS_VERSION = 1.10.22
+DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
-- 
2.7.3
