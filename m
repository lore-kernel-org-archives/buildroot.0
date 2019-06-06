From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:41:48 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] tslib: update to 1.20
Message-ID: <20190606074234.8AB84813D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07aba4fa5cfa77c85c81c82132b1ddd7477bcf8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The release page has a changelog overview:
https://github.com/libts/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75139dfecd89bf4098f4a394abeee5650ee59f87)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
