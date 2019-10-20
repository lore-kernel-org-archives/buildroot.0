From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Oct 2019 11:53:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/dialog: bump version to 1.3-20190808
Message-ID: <20191020095348.3246-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dialog/dialog.hash | 4 +++-
 package/dialog/dialog.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index ac42784690..98e2229ce8 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 2ff1ba74c632b9d13a0d0d2c942295dd4e8909694eeeded7908a467d0bcd4756  dialog-1.3-20170509.tgz
+sha256 886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2  dialog-1.3-20190808.tgz
+# Locally computed
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index b1933b8836..ae3d2d466a 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20170509
+DIALOG_VERSION = 1.3-20190808
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
-DIALOG_SITE = ftp://ftp.invisible-island.net/dialog
+DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
 DIALOG_DEPENDENCIES = host-pkgconf ncurses $(TARGET_NLS_DEPENDENCIES)
-- 
2.20.1
