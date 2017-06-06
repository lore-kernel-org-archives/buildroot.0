From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 17:19:35 +0200
Subject: [Buildroot] [git commit] package/tslib: bump version to 1.11
Message-ID: <20170606152059.33F4682A66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56e2e318c7cf6268d7c486cdf47c341aae2765d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes for the curious:
   https://github.com/kergoth/tslib/blob/master/NEWS

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 1eeafd0..87d72ac 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.10/tslib-1.10.tar.xz.sha256
-sha256  26ce1df4647dc8d16f6247062f30a8a03c34165dd19e042d0b2df8860da265b2  tslib-1.10.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.11/tslib-1.11.tar.xz.sha256
+sha256  90d22b2f1b6dc9899d9491bc0480dfdcb2b55ff6e620ebb999d607aa5389af06  tslib-1.11.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 9d7b926..87eb5b7 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.10
+TSLIB_VERSION = 1.11
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
