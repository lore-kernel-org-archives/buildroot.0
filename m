From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 20:45:10 +0200
Subject: [Buildroot] [git commit] xutil_util-macros: version bump to 1.11.0
	and xutil_util-macros-1.3.0.patch deleted
Message-ID: <20120922194142.D32B59963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc405fb9b810a8f03dd3605da7138cafa19eb574
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xutil_util-macros-1.3.0.patch                  |    9 ---------
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 2 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
deleted file mode 100644
index de3ff01..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- xutil_util-macros-1.3.0/xorg-macros.m4.in.orig	2010-01-23 19:23:30.306334212 +0200
-+++ xutil_util-macros-1.3.0/xorg-macros.m4.in	2010-01-23 19:25:03.462333685 +0200
-@@ -499,3 +499,6 @@ XORG_RELEASE_VERSION
- XORG_CHANGELOG
- XORG_MANPAGE_SECTIONS
- ]) # XORG_DEFAULT_OPTIONS
-+
-+# Buildroot stuff
-+AC_SUBST(STAGING_DIR)
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 1823937..7a13a61 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.3.0
+XUTIL_UTIL_MACROS_VERSION = 1.11.0
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
