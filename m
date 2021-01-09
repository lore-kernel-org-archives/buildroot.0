From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jan 2021 16:10:20 +0100
Subject: [Buildroot] [git commit] package/dbus: bump to version 1.12.20
Message-ID: <20210109145346.281717FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c80989aa9d6a638a8fc953320f255f367d017617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/Config.in | 2 +-
 package/dbus/dbus.hash | 5 +++--
 package/dbus/dbus.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 653f7482f6..5650b5777b 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DBUS
 	help
 	  The D-Bus message bus system.
 
-	  http://www.freedesktop.org/wiki/Software/dbus
+	  https://www.freedesktop.org/wiki/Software/dbus
 
 comment "dbus needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index cfa06301f6..06512e5656 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.18.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306  dbus-1.12.18.tar.gz
+sha256  f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe  dbus-1.12.20.tar.gz
+
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 279252bd78..75142ea200 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.18
+DBUS_VERSION = 1.12.20
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
