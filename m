From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:10 +0200
Subject: [Buildroot] [PATCH 56/63] xutil_util-macros: version bump to 1.11.0
	and xutil_util-macros-1.3.0.patch deleted
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-57-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xutil_util-macros-1.3.0.patch                  |    9 ---------
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 2 files changed, 1 insertions(+), 10 deletions(-)
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch

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
index b600a46..167cbe9 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.3.0
+XUTIL_UTIL_MACROS_VERSION = 1.11.0
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_AUTORECONF = NO
-- 
1.7.3.4
