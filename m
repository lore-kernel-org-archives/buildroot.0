From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:00:46 +0100
Subject: [Buildroot] [git commit] dbus: bump to version 1.10.8
Message-ID: <20160308200222.C3251803D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68e34ea9f39a1a183cd02ea1e06c3dbff5f2381e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 10ebc81..d38b298 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f  dbus-1.10.6.tar.gz
+sha256	baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014  dbus-1.10.8.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 33bfb31..fbdceb3 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.6
+DBUS_VERSION = 1.10.8
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1, GPLv2+
 DBUS_LICENSE_FILES = COPYING
