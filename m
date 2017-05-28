From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 12:17:05 +0200
Subject: [Buildroot] [PATCH/next] package/dvblast: bump version to 3.1
Message-ID: <20170528101705.14092-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream now provides sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dvblast/dvblast.hash | 6 ++----
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index 198549f4c..d6ec4cb03 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,4 +1,2 @@
-# from https://get.videolan.org/dvblast/3.0/dvblast-3.0.tar.bz2.md5
-md5 89ea9ffb16476d47b8853e52a8a3ee63 dvblast-3.0.tar.bz2
-# locally calculated
-sha256 4fc3eb2a3d3545cb76a5c515a16671d1c34fe2f5dad57b71e89bd54c14c3045e dvblast-3.0.tar.bz2
+# From https://get.videolan.org/dvblast/3.1/dvblast-3.1.tar.bz2
+sha256 3159e8666a3b1822aeccd01684bdcad712a0da88d758bef6b7e2c396f27fd3e0  dvblast-3.1.tar.bz2
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 1247276b8..3cf24df24 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVBLAST_VERSION = 3.0
+DVBLAST_VERSION = 3.1
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL
-- 
2.11.0
