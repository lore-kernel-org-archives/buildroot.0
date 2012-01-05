From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:22 -0300
Subject: [Buildroot] [PATCH 09/10] dialog: bump to version 1.1-20111020
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
