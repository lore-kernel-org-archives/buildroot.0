From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 3 Mar 2017 08:43:54 +0100
Subject: [Buildroot] [PATCH] tslib: bump to version 1.6
Message-ID: <1488527034-23249-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index d7ae4dc..649822e 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.5/tslib-1.5.tar.xz.sha256
-sha256  94874fe72c5af5c9be642a2ce524f014eb1d59d15cf852f2d3b2cf380f04252d  tslib-1.5.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.6/tslib-1.6.tar.xz.sha256
+sha256  b9fbb93984d02506c5a944d475d0bf7f19473a111e547f523328138ed5c6e02b  tslib-1.6.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 08b1d26..0940d0d 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.5
+TSLIB_VERSION = 1.6
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
-- 
2.1.4
