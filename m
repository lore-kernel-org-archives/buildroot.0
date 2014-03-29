From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:21 +0100
Subject: [Buildroot] [PATCH 50/91] xapp_xman: Bump version to 1.1.3
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xman/xapp_xman.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 2828805..7b3fbd5 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMAN_VERSION = 1.0.3
+XAPP_XMAN_VERSION = 1.1.3
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAN_LICENSE = MIT
@@ -13,6 +13,7 @@ XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
-		ac_cv_file__etc_manpath_config=no
+		ac_cv_file__etc_manpath_config=no \
+		ac_cv_file__usr_share_misc_man_conf=no
 
 $(eval $(autotools-package))
-- 
1.7.10.4
