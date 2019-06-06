From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:24:57 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/tslib: update
 upstream source address
Message-ID: <20190606073243.251068F059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d2e12e1586dfd3289b7a3c79f206a1c424de0f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The project has been moved from the kergoth user account to the
libts organisation on github. While github seems to maintain redirects,
we should use the new location directly.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4161f9f1c92d37c5cae336ab94480d9931f2ef7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
