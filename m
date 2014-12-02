From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 12:59:33 +0100
Subject: [Buildroot] [git commit] dialog: bump to version 1.2-20140911
Message-ID: <20141202120522.C353680075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd1868ee61a8a02324103c5b3cb2c77d957bb61f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.hash |    2 ++
 package/dialog/dialog.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
