From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:20:50 +0100
Subject: [Buildroot] [git commit] dialog: add license information
Message-ID: <20130129223111.9F6079A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ec86f27b2d5790ee3e4775a239b1b72906c4dce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is LGPLv2.1]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dialog/dialog.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 8d87b77..6d46299 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -10,6 +10,8 @@ DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPT = --with-ncurses
 DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
+DIALOG_LICENSE = LGPLv2.1
+DIALOG_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES+=libiconv
