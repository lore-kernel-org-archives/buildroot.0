From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Apr 2017 14:21:29 +0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.18
Message-ID: <1faf3e6543a43776864a74191a7e55d6a0f7d7fd.1492687289.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index af8143d315d6..28c750f5aad4 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a7b0ba6ea3e8d0e08afec5e3030d0245614268276620c536726f8fa6e5c43388  dbus-1.10.16.tar.gz
+sha256	6049ddd5f3f3e2618f615f1faeda0a115104423a7996b7aa73e2f36e38cc514a  dbus-1.10.18.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 52c1912e073b..d333b203be0c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.16
+DBUS_VERSION = 1.10.18
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.11.0
