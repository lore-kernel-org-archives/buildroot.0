From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:33:19 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/dialog: fix
	upstream source URL
Message-ID: <20170906112607.A31F681838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af76cb192ae57b1f2e1a01e365a849d271780730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 5fdebd3b8aad0407c0eeaeef5998562d17c5e42a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index f207f75..1318770 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -6,7 +6,7 @@
 
 DIALOG_VERSION = 1.2-20150125
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
-DIALOG_SITE = ftp://invisible-island.net/dialog
+DIALOG_SITE = ftp://ftp.invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
 DIALOG_DEPENDENCIES = host-pkgconf ncurses
