From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 20:31:14 +0100
Subject: [Buildroot] [git commit] xapp_xman: replace := by =
Message-ID: <20130102200335.9AA1E9A5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fb388c677e33d3031e62a13335e3bacfcc28f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xman/xapp_xman.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
