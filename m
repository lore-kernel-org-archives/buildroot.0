From: Martin Kepplinger <martink@posteo.de>
Date: Thu,  6 Sep 2018 11:35:50 +0200
Subject: [Buildroot] [PATCH] tslib: update to 1.17
Message-ID: <20180906093550.29541-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some background see the changelog summary:
https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 76cd79516b..c5fc836d64 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/kergoth/tslib/releases/download/1.16/tslib-1.16.tar.xz.sha256
-sha256  c9a54651337a701a66b074c603c313225579995a7910e519bbc7b1dcdab9a755  tslib-1.16.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.17/tslib-1.17.tar.xz.sha256
+sha256  9fdd33e66976bf9cc799be33824ba66672f892826e9b22de12b14df15cb0fddc  tslib-1.17.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 0d8b31863b..bd5311b93b 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.16
+TSLIB_VERSION = 1.17
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.18.0
