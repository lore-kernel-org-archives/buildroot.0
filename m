From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 13:17:55 +0100
Subject: [Buildroot] [git commit] dbus: security bump to version 1.8.10
Message-ID: <20141114121920.073589D7B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eda279220422fb794138d34e901eee02f95dda14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-7824 - Denial of service via incomplete fix for CVE-2014-3636

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash |    2 ++
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
new file mode 100644
index 0000000..516b87c
--- /dev/null
+++ b/package/dbus/dbus.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	10bf87fdb68815edd01d53885101dbcdd80dacad7198912cca61a4fa22dfaf8e	dbus-1.8.10.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 519146c..2d5d2c8 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.8.8
+DBUS_VERSION = 1.8.10
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
