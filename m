From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Dec 2019 09:53:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump to version 9.11.0
Message-ID: <20191208085325.1358857-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/drbd-utils/drbd-utils.hash | 3 ++-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index bcbed1ee8a..884d6790ec 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 11299b555b703440ef0af2c74b69cf6dfb833e050b87cfdc3b93d0b71d8820a6  drbd-utils-9.2.0.tar.gz
+sha256 e07d156ce6e3d93ac1b69fa9bf8695038e6e5edfb2c80c91a1098d1477478ecb  drbd-utils-9.11.0.tar.gz
+sha256 1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index bb28729b40..55ac9d9dc0 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.2.0
+DRBD_UTILS_VERSION = 9.11.0
 DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
-- 
2.24.0
