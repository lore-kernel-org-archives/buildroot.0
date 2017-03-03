From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 21:50:54 +0100
Subject: [Buildroot] [git commit] tslib: bump to version 1.6
Message-ID: <20170303205058.24B89822FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ad80a12433fdf72f14c8fe489aba1761a4c08a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
