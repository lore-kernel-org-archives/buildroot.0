From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:59:39 +0200
Subject: [Buildroot] [git commit] package/dialog: bump version to
	1.3-20170509
Message-ID: <20170601202856.57970820E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371ded7ab2a82c609f538b8a24dab02923140574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 75a7918..ac42784 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1d98ec7cc81f11f9019fa0b90f1afdaa86579cae1ce8869a6fd61deb9d4b887a	dialog-1.2-20150125.tgz
+sha256 2ff1ba74c632b9d13a0d0d2c942295dd4e8909694eeeded7908a467d0bcd4756  dialog-1.3-20170509.tgz
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index f1c0e4c..61ec265 100644
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
