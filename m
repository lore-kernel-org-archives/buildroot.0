From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 17 May 2019 12:46:20 +0200
Subject: [Buildroot] [PATCH] tslib: update upstream source address
Message-ID: <20190517104620.21939-1-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project has been moved from the kergoth user account to the
libts organisation on github. While github seems to maintain redirects,
we should use the new location directly.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/tslib.hash | 2 +-
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index cfe78765bc..269d8f95fe 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,4 +1,4 @@
-# https://github.com/kergoth/tslib/releases/download/1.19/tslib-1.19.tar.xz.sha256
+# https://github.com/libts/tslib/releases/download/1.19/tslib-1.19.tar.xz.sha256
 sha256  efe1fef16a00dc818f1d8e402877184dadf331f1b0dd1fbfeeb2698ee8647f4d  tslib-1.19.tar.xz
 
 # Locally computed
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index ccc2671c6a..9d21647033 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSLIB_VERSION = 1.19
-TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
+TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 TSLIB_LICENSE_FILES = COPYING
-- 
2.20.1

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190517/ee85f5c1/attachment.bin>
