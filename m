From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Feb 2018 23:11:26 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.7.3
Message-ID: <20180211221126.4932-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index c72565d2bf..c75854d2ac 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e5101b6c0416d26b8ce2dd3fcdd779eacd93d765a1872789ba099a5f31a338e7  cjson-v1.7.2.tar.gz
+sha256 726a60137ab1aa6784dc575bf7d4c92f5367e937739c8bffcddce79071cf5f50  cjson-v1.7.3.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 31d57e1f2b..08020c48f6 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.2
+CJSON_VERSION = v1.7.3
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.14.1
