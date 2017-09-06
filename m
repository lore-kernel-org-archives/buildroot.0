From: Martin Kepplinger <martink@posteo.de>
Date: Wed,  6 Sep 2017 16:15:28 +0200
Subject: [Buildroot] [PATCH] x11r7/xdriver_xf86-input-tslib: update to 1.1.0
Message-ID: <20170906141528.25203-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/merge/xf86-input-tslib/releases has the summary of changes.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index 23d7a61422..84b3857dcc 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/merge/xf86-input-tslib/releases/download/1.0.0/xf86-input-tslib-1.0.0.tar.bz2.sha256
-sha256 2e888893b766bb987ed4d788555dc221e3974068580ba782753a4a80532a42e7  xf86-input-tslib-1.0.0.tar.bz2
+# https://github.com/merge/xf86-input-tslib/releases/download/1.1.0/xf86-input-tslib-1.1.0.tar.bz2.sha256
+sha256 5e5626c1127fe945270d819281ad15f2f924f4e35bad0903db9748635c2af432  xf86-input-tslib-1.1.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index d2d9df47af..d9555b795f 100644
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
-- 
2.11.0
