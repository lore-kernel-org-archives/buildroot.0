From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:37 -0000
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.10
Message-ID: <20160902142936.3DE22822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3a1d96f8903b3d8ba288a932f3427109854c674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index d38b298..1b20d3f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014  dbus-1.10.8.tar.gz
+sha256	9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43  dbus-1.10.10.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 6064501..1388e34 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.8
+DBUS_VERSION = 1.10.10
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
