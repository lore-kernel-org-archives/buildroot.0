From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:51 -0300
Subject: [Buildroot] [PATCH 02/10] dialog: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/dialog.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 8d87b77..bac788b 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -10,6 +10,8 @@ DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPT = --with-ncurses
 DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
+DIALOG_LICENSE = LGPLv2.1+
+DIALOG_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES+=libiconv
-- 
1.7.12.4
