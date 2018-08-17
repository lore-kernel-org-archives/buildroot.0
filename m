From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 17:05:34 +0200
Subject: [Buildroot] [git commit] dbus: bump to version 1.2.10
Message-ID: <20180817145906.199558D4F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45768d28f171c4649d0f47ea174fca8ad66a1e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 5 +++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 91d270eb13..92c0c94210 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.8.tar.gz.asc
-sha256	e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3  dbus-1.12.8.tar.gz
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.10.tar.gz.asc
+# using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
+sha256	4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7  dbus-1.12.10.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8cf4367bf2..0a56de5a4e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.8
+DBUS_VERSION = 1.12.10
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
