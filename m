From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Nov 2015 13:03:10 -0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.4
Message-ID: <1447862590-19667-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7e21dd0..87efd4b 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e  dbus-1.10.2.tar.gz
+sha256	ad7dcad73ad9b0ff55819985d354eacfffe07e2eb8c763e155efc21d6001084b  dbus-1.10.4.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 9e722d8..79cd678 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.2
+DBUS_VERSION = 1.10.4
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
-- 
2.4.10
