From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:58 +0200
Subject: [Buildroot] [git commit] xapp_xlsclients: bump version
Message-ID: <20120922194205.B40CB9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43abf908fa9328e5d173e8b4cb8c4d75c6256638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 92c7d53..28ca4ee 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSCLIENTS_VERSION = 1.0.2
+XAPP_XLSCLIENTS_VERSION = 1.1.0
 XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
