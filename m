From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Aug 2016 09:37:45 -0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.10
Message-ID: <1471351065-13862-1-git-send-email-gustavo@zacarias.com.ar>
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
-- 
2.7.3
