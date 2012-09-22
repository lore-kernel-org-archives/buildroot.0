From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:57 +0200
Subject: [Buildroot] [git commit] xapp_xkbutils: bump version
Message-ID: <20120922194204.A9262996D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b974d587438e81d8d5c236dbad9a3f957b239c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index d749d18..632fcf3 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.2
+XAPP_XKBUTILS_VERSION = 1.0.3
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
