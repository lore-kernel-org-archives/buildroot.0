From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:38:59 +0200
Subject: [Buildroot] [git commit] package/tslib: update to 1.13
Message-ID: <20170924124820.3070F806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d51c1e0861d65d131ea70691f2ff9de5b7c07955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index f053c6c..3ed4900 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.12/tslib-1.12.tar.xz.sha256
-sha256  237f66c9e53789429b1bcc89a36eb7a37f1deb2877e6e7d928e994e3c48d0b83  tslib-1.12.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.13/tslib-1.13.tar.xz.sha256
+sha256  b381279f2d6ad6acb80cfc4852860853b7bcd1a9440821e9fe920c33f4e4f8da  tslib-1.13.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 2b4320d..06f887a 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.12
+TSLIB_VERSION = 1.13
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
