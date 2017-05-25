From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 00:28:29 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/dialog: bump version to
	1.3-20170509
Message-ID: <20170525222829.32718-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 75a79189c..ac4278469 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1d98ec7cc81f11f9019fa0b90f1afdaa86579cae1ce8869a6fd61deb9d4b887a	dialog-1.2-20150125.tgz
+sha256 2ff1ba74c632b9d13a0d0d2c942295dd4e8909694eeeded7908a467d0bcd4756  dialog-1.3-20170509.tgz
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index f1c0e4c06..61ec2659a 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.2-20150125
+DIALOG_VERSION = 1.3-20170509
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.11.0
