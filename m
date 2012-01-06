From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 11:08:53 +0100
Subject: [Buildroot] [git commit] dialog: bump to version 1.1-20111020
Message-ID: <20120106101009.5F81A90018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f0b667cd2b9cec7794bc0d35c049a9acd6094ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dialog/dialog.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 0a4f792..175ed93 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -3,9 +3,10 @@
 # dialog
 #
 #############################################################
-DIALOG_VERSION:=1.1-20100428
-DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
-DIALOG_SITE:=ftp://invisible-island.net/dialog
+
+DIALOG_VERSION = 1.1-20111020
+DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
+DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPT = --with-ncurses
 DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
