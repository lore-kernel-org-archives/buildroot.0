From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Mar 2018 11:55:06 +0300
Subject: [Buildroot] [PATCH] dbus: bump to version 1.12.6
Message-ID: <3c5c5f470fdccb353d689dd9aae14d9505eb4ddb.1521795306.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 1aa5aa445d8d..66fce31461bb 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.2.tar.gz.asc
-sha256	272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88  dbus-1.12.2.tar.gz
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.6.tar.gz.asc
+sha256	621b902a07badec16c9e43eda43903cd0e1e69e11b13143da71c1889b062f116  dbus-1.12.6.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 22ba22e17ef8..8771412be4b1 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.2
+DBUS_VERSION = 1.12.6
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.16.2
