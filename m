From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:17:02 +0100
Subject: [Buildroot] [git commit] xapp_xman: Bump version to 1.1.3
Message-ID: <20140329222159.19F2A9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8e71ebe192edc1c2ed3ee284f20430b01924f93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xman/xapp_xman.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
