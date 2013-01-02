From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:37 +0100
Subject: [Buildroot] [PATCH 02/20] xapp_xman: replace := by =
In-Reply-To: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fe9ca1ed9d5984babd68d59dde034a1db3ca524a.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xman/xapp_xman.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 0fa2582..0c39aaf 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -3,9 +3,9 @@
 # xapp_xman - Manual page display program for the X Window System
 #
 #############################################################
-XAPP_XMAN_VERSION:=1.0.3
-XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
-XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAN_VERSION = 1.0.3
+XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
+XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
-- 
1.7.9.5
