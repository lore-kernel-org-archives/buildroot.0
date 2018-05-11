From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:29:35 +0200
Subject: [Buildroot] [git commit branch/next] dbus: bump to version 1.12.8
Message-ID: <20180511202943.350588C9FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d25bdbeec96a8d064de72a0cd8db62b97f426ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 66fce31461..91d270eb13 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.6.tar.gz.asc
-sha256	621b902a07badec16c9e43eda43903cd0e1e69e11b13143da71c1889b062f116  dbus-1.12.6.tar.gz
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.8.tar.gz.asc
+sha256	e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3  dbus-1.12.8.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8771412be4..8cf4367bf2 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.6
+DBUS_VERSION = 1.12.8
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
