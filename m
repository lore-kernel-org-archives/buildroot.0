From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:00:19 +0200
Subject: [Buildroot] [git commit] x11r7/xdriver_xf86-input-tslib: update to
	1.1.0
Message-ID: <20170906195307.40FBC82153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8d76469a3a01a74ed68c732984e601ea351bef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/merge/xf86-input-tslib/releases has the summary of changes.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index 23d7a61..84b3857 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/merge/xf86-input-tslib/releases/download/1.0.0/xf86-input-tslib-1.0.0.tar.bz2.sha256
-sha256 2e888893b766bb987ed4d788555dc221e3974068580ba782753a4a80532a42e7  xf86-input-tslib-1.0.0.tar.bz2
+# https://github.com/merge/xf86-input-tslib/releases/download/1.1.0/xf86-input-tslib-1.1.0.tar.bz2.sha256
+sha256 5e5626c1127fe945270d819281ad15f2f924f4e35bad0903db9748635c2af432  xf86-input-tslib-1.1.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index d2d9df4..d9555b7 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.0.0
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.1.0
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(XDRIVER_XF86_INPUT_TSLIB_VERSION)
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
