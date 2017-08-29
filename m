From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 21:58:37 +0200
Subject: [Buildroot] [git commit] package/dialog: fix upstream source URL
Message-ID: <20170829195134.530BE81EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fdebd3b8aad0407c0eeaeef5998562d17c5e42a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/dialog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 61ec265..73fabe0 100644
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
