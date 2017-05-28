From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 15:42:30 +0200
Subject: [Buildroot] [PATCH/next] package/flann: bump version to 1.9.1
Message-ID: <20170528134230.11926-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flann/flann.hash | 2 +-
 package/flann/flann.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flann/flann.hash b/package/flann/flann.hash
index 08242eb2d..c2c41beb0 100644
--- a/package/flann/flann.hash
+++ b/package/flann/flann.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3fec86866987c792c3fce7ecc8ba9d09a003f5d2d1a1ad94864550aad73a5c0b  flann-3645f0c30a47267e56e5acdecfc7bac2b76bc3d5.tar.gz
+sha256 b23b5f4e71139faa3bcb39e6bbcc76967fbaf308c4ee9d4f5bfbeceaa76cc5d3  flann-1.9.1.tar.gz
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index abfd0cdc4..e777fd8b2 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANN_VERSION = 3645f0c30a47267e56e5acdecfc7bac2b76bc3d5
+FLANN_VERSION = 1.9.1
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3-Clause
-- 
2.11.0
