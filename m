From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:42:54 +0200
Subject: [Buildroot] [git commit] tslib: update to 1.16
Message-ID: <20180419204311.131D388811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b50a2b40a22295064aebe622e0c35e5fd4530a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For those who wonder what happend, as usual, there's a changelog summary:
https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index f0c6ff842f..76cd79516b 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/kergoth/tslib/releases/download/1.15/tslib-1.15.tar.xz.sha256
-sha256  7ce48807cab655076d71a1ceef3ed0ab8a25df98074981d4a8fd1477ee5f710c  tslib-1.15.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.16/tslib-1.16.tar.xz.sha256
+sha256  c9a54651337a701a66b074c603c313225579995a7910e519bbc7b1dcdab9a755  tslib-1.16.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 3ba94d2568..0d8b31863b 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.15
+TSLIB_VERSION = 1.16
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
