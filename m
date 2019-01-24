From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 10:46:12 +0100
Subject: [Buildroot] [git commit] tslib: update to 1.19
Message-ID: <20190124094754.51A827FF3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e80e2e6a33e3cd6e010a685c4cfcabf00c2e2cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the curious, there's the short changelog summary:
https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index a758702e74..cfe78765bc 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/kergoth/tslib/releases/download/1.18/tslib-1.18.tar.xz.sha256
-sha256  986cce6d8ed896c0eba68d78acd788c7860ffe8a2165a9f631954e7f2889958b  tslib-1.18.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.19/tslib-1.19.tar.xz.sha256
+sha256  efe1fef16a00dc818f1d8e402877184dadf331f1b0dd1fbfeeb2698ee8647f4d  tslib-1.19.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index f5c4cd7997..ccc2671c6a 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.18
+TSLIB_VERSION = 1.19
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
