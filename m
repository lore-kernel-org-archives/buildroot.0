From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Feb 2021 20:56:08 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/dfu-util: bump to version 0.10
Message-ID: <20210227195608.21466-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://sourceforge.net/p/dfu-util/dfu-util/ci/v0.10/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dfu-util/dfu-util.hash | 8 ++++----
 package/dfu-util/dfu-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
index 7c66a93376..a99e67565d 100644
--- a/package/dfu-util/dfu-util.hash
+++ b/package/dfu-util/dfu-util.hash
@@ -1,6 +1,6 @@
-# From http://dfu-util.sourceforge.net/releases/dfu-util-0.9.tar.gz.md5
-md5	233bb1e08ef4b405062445d84e28fde6	dfu-util-0.9.tar.gz
+# From http://dfu-util.sourceforge.net/releases/dfu-util-0.10.tar.gz.md5
+md5  8cf55663703cdc6b40f377f999eb8d3d  dfu-util-0.10.tar.gz
 
 # Locally computed
-sha256	36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833	dfu-util-0.9.tar.gz
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42  dfu-util-0.10.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 5e8ba5a8f2..9f26948a1a 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DFU_UTIL_VERSION = 0.9
+DFU_UTIL_VERSION = 0.10
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPL-2.0+
 DFU_UTIL_LICENSE_FILES = COPYING
-- 
2.30.0
