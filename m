From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 21:28:30 +0100
Subject: [Buildroot] [git commit] dbus: bump version
Message-ID: <20141216203035.5B478803FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f66ea18d98f141baae7de2970ca29286b1761749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Regression fix for CVE-2014-3636, see release announcement:
http://lists.freedesktop.org/archives/dbus/2014-November/016430.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash |    4 ++--
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 516b87c..4ae6d03 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	10bf87fdb68815edd01d53885101dbcdd80dacad7198912cca61a4fa22dfaf8e	dbus-1.8.10.tar.gz
+# Locally calculated
+sha256	c91428f28d2925ba32d34ffc824bfcf4d40d5e1e67befc4bcf2202f0a862501e  dbus-1.8.12.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ed400e8..8d02b42 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.10
+DBUS_VERSION = 1.8.12
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
