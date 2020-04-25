From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 25 Apr 2020 16:46:50 -0500
Subject: [Buildroot] [PATCH] package/dialog: bump to version 1.3-20200327
Message-ID: <20200425214650.5576-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash file to two space format.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/dialog/dialog.hash | 4 ++--
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index e1768588d8..2286590b66 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 10f7c02ee5dea311e61b0d3e29eb6e18bcedd6fb6672411484c1a37729cbd7a6  dialog-1.3-20191210.tgz
+sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
 # Locally computed
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index f3b66bae09..1c98d354e3 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20191210
+DIALOG_VERSION = 1.3-20200327
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.17.1
