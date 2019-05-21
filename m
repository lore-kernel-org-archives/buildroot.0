From: Martin Kepplinger <martink@posteo.de>
Date: Tue, 21 May 2019 08:41:01 +0200
Subject: [Buildroot] [PATCH] tslib: update to 1.20
Message-ID: <20190521064101.31715-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The release page has a changelog overview:
https://github.com/libts/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

IMO this release qualifies for being included in a stable branch.

thanks
                          martin



 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 269d8f95fe..b250783fda 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.19/tslib-1.19.tar.xz.sha256
-sha256  efe1fef16a00dc818f1d8e402877184dadf331f1b0dd1fbfeeb2698ee8647f4d  tslib-1.19.tar.xz
+# https://github.com/libts/tslib/releases/download/1.20/tslib-1.20.tar.xz.sha256
+sha256  fda8c088e348b40cc68269460d562778aa4ad8f8c2281f147b09f305ba714777  tslib-1.20.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 9d21647033..6d6e85033b 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.19
+TSLIB_VERSION = 1.20
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.20.1
