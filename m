From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:00 +0200
Subject: [Buildroot] [PATCH 1/6] package/dialog: fix upstream source URL
Message-ID: <20170829191005.19697-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dialog/dialog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 61ec2659a..73fabe07c 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -6,7 +6,7 @@
 
 DIALOG_VERSION = 1.3-20170509
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
-DIALOG_SITE = ftp://invisible-island.net/dialog
+DIALOG_SITE = ftp://ftp.invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
 DIALOG_DEPENDENCIES = host-pkgconf ncurses
-- 
2.11.0
