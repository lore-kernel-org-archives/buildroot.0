From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Dec 2014 07:10:57 -0300
Subject: [Buildroot] [PATCH 1/2] dialog: bump to version 1.2-20140911
Message-ID: <1417515058-20194-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/dialog.hash | 2 ++
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/dialog/dialog.hash

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
new file mode 100644
index 0000000..1ffbafb
--- /dev/null
+++ b/package/dialog/dialog.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d054766fba3dac828851f1c9852e5992eb824fd0a0dd26d87ee517242027bafc	dialog-1.2-20140911.tgz
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 542699b..0ecbddb 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.2-20140219
+DIALOG_VERSION = 1.2-20140911
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.0.4
