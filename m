From: Martin Kepplinger <martink@posteo.de>
Date: Sun, 10 Sep 2017 11:31:25 +0200
Subject: [Buildroot] [PATCH] x11r7: xdriver_xf86-input-tslib: update to
	version 1.1.1
Message-ID: <20170910093125.17948-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to bugfix release 1.1.1, see

    https://github.com/merge/xf86-input-tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash | 4 ++--
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index 84b3857dcc..faff5d4798 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/merge/xf86-input-tslib/releases/download/1.1.0/xf86-input-tslib-1.1.0.tar.bz2.sha256
-sha256 5e5626c1127fe945270d819281ad15f2f924f4e35bad0903db9748635c2af432  xf86-input-tslib-1.1.0.tar.bz2
+# https://github.com/merge/xf86-input-tslib/releases/download/1.1.1/xf86-input-tslib-1.1.1.tar.bz2.sha256
+sha256 8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index d9555b795f..bf0ee4860d 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.1.0
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.1.1
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(XDRIVER_XF86_INPUT_TSLIB_VERSION)
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
-- 
2.11.0
