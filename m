From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Jun 2020 22:51:43 +0200
Subject: [Buildroot] [PATCH v1] package/doxygen: bump version to 1.18.18
Message-ID: <20200602205143.22391-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/doxygen/doxygen.hash | 4 ++--
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index 90d4e978bc..ff2fac7b9c 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599  doxygen-1.8.17.src.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656  doxygen-1.8.18.src.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 52e96f3807..6d8727208a 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.17
+DOXYGEN_VERSION = 1.8.18
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://doxygen.nl/files
 DOXYGEN_LICENSE = GPL-2.0
-- 
2.26.2
