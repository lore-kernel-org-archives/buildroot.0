From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 07:24:09 +0100
Subject: [Buildroot] [git commit] tslib: update to 1.7
Message-ID: <20170314062533.9617F7F97A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9738f31787c488ab195cc13d38a58a3f3236418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 649822e..dea1f91 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.6/tslib-1.6.tar.xz.sha256
-sha256  b9fbb93984d02506c5a944d475d0bf7f19473a111e547f523328138ed5c6e02b  tslib-1.6.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.7/tslib-1.7.tar.xz.sha256
+sha256  f2a4a416331dd2f38cea84cc526f23da1c342a2588cfae72fe070908f08b5ce8  tslib-1.7.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 0940d0d..e19c8d2 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.6
+TSLIB_VERSION = 1.7
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
