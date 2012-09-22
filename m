From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:58 +0200
Subject: [Buildroot] [git commit] xapp_xset: bump version
Message-ID: <20120922194208.289A29963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ed1bb4d59c88d3bb497a7c4998dbaca75919459
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xset/xapp_xset.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 5eeb937..088cebc 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSET_VERSION = 1.1.0
+XAPP_XSET_VERSION = 1.2.1
 XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
