From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Mar 2020 16:22:30 -0600
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.6.0
Message-ID: <20200324222230.128927-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 10 +++++-----
 package/wpebackend-fdo/wpebackend-fdo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index fbeed390e6..1380934af3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.4.1.tar.xz.sums
-md5 c6362491a4a38ddac42b66f140e1cff2 wpebackend-fdo-1.4.1.tar.xz
-sha1 9217c8a5511bc53544b42cb23390256580ac4b0c wpebackend-fdo-1.4.1.tar.xz
-sha256 6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d wpebackend-fdo-1.4.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.6.0.tar.xz.sums
+md5  456afeed22f6749f7b2a97c11660835d  wpebackend-fdo-1.6.0.tar.xz
+sha1  d128e2c7ff273d9b9f31217f6ac25be3b266d805  wpebackend-fdo-1.6.0.tar.xz
+sha256  7f5bd7b9d8f97b1655f4dcd39fad92719d0fb3985b251da5802df13aaa09f567  wpebackend-fdo-1.6.0.tar.xz
 
 # Hashes for license files:
-sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825 COPYING
+sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 4a7c569d9c..99e10c5a01 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.4.1
+WPEBACKEND_FDO_VERSION = 1.6.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.20.1
