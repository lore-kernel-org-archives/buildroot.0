From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 12:33:13 +0100
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.2
Message-ID: <20151027113420.A9423803D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ca1cba1152f659283fcc1bf044500792240268b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash |    2 +-
 package/dbus/dbus.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 4db2dd3..7e21dd0 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1dfb9745fb992f1ccd43c920490de8caddf6726a6222e8b803be6098293f924b  dbus-1.10.0.tar.gz
+sha256	aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e  dbus-1.10.2.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 139a5d7..9e722d8 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.0
+DBUS_VERSION = 1.10.2
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
