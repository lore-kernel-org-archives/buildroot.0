From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Fri, 25 Sep 2020 10:58:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to 7.1.1
Message-ID: <20200925085801.1021665-1-zgyarmati@zgyarmati.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index ac3d12b271..0d59d54e26 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-7.0.1.tar.gz.md5
-md5  5ba7536b579a6c9e0ad822dbdd455985  proj-7.0.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-7.1.1.tar.gz.md5
+md5  b7ce84943dcf2b660b11c2ef9657dad5  proj-7.1.1.tar.gz
 # Locally calculated
-sha256  a7026d39c9c80d51565cfc4b33d22631c11e491004e19020b3ff5a0791e1779f  proj-7.0.1.tar.gz
+sha256  324e7abb5569fb5f787dadf1d4474766915c485a188cf48cf07153b99156b5f9  proj-7.1.1.tar.gz
 sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 1c8f3f77c5..663db4abcc 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 7.0.1
+PROJ_VERSION = 7.1.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.28.0
