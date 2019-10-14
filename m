From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 10:28:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.13.12
Message-ID: <20191014162801.85295-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 9529d2e04f..aaa3166a7e 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.16.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.13.12.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256	54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80  dbus-1.12.16.tar.gz
+sha256	7588649b56dd257c6a5f85a8c45aa2dfdf9e99f4de3983710f452081ca43eca6  dbus-1.13.12.tar.xz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a4043864d1..a8e37035f0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.16
+DBUS_VERSION = 1.13.12
+DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.20.1
