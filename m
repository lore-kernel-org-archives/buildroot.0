From: Martin Kepplinger <martink@posteo.de>
Date: Tue, 29 Aug 2017 19:02:27 +0200
Subject: [Buildroot] [PATCH] tslib: update to version 1.12
Message-ID: <20170829170227.26431-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The release page has a short changelog overview:

    https://github.com/kergoth/tslib/releases/tag/1.12

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 87d72acc0..f053c6cab 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.11/tslib-1.11.tar.xz.sha256
-sha256  90d22b2f1b6dc9899d9491bc0480dfdcb2b55ff6e620ebb999d607aa5389af06  tslib-1.11.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.12/tslib-1.12.tar.xz.sha256
+sha256  237f66c9e53789429b1bcc89a36eb7a37f1deb2877e6e7d928e994e3c48d0b83  tslib-1.12.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 5190465f1..2b4320dca 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.11
+TSLIB_VERSION = 1.12
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.11.0
