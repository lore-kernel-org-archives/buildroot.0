From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:59:19 +0200
Subject: [Buildroot] [git commit] dvblast: bump to version 3.3
Message-ID: <20180923150422.9A2388890E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dea966f897d9accdc088eac846c23e3a0c6c75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dvblast/dvblast.hash | 6 ++++--
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index d6ec4cb036..decade15ce 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,2 +1,4 @@
-# From https://get.videolan.org/dvblast/3.1/dvblast-3.1.tar.bz2
-sha256 3159e8666a3b1822aeccd01684bdcad712a0da88d758bef6b7e2c396f27fd3e0  dvblast-3.1.tar.bz2
+# From https://get.videolan.org/dvblast/3.3/dvblast-3.3.tar.bz2
+sha256 3d75d0785bc147d5c3f2360637cf869eec405d83742ae8a211adaf645b963387  dvblast-3.3.tar.bz2
+sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
+sha256 2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 3cf24df248..bae6367bef 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVBLAST_VERSION = 3.1
+DVBLAST_VERSION = 3.3
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL
