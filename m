From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Dec 2016 11:23:19 -0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.10.14
Message-ID: <1480688599-4193-1-git-send-email-gustavo@zacarias.com.ar>
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
index 27d38ea..14bee20 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	210a79430b276eafc6406c71705e9140d25b9956d18068df98a70156dc0e475d  dbus-1.10.12.tar.gz
+sha256	23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083  dbus-1.10.14.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8657128..c765e0a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.12
+DBUS_VERSION = 1.10.14
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.7.3
