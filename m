From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 May 2018 23:14:43 +0200
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.7.7
Message-ID: <20180524211443.3320-1-fontaine.fabrice@gmail.com>
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
index fd511afe6c..278484bdd3 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 d1ca2665b34fea164a877637b4ad1624aa23390fe75de91b88e18c5d6ec91978  cjson-v1.7.6.tar.gz
+sha256 6eb9d852a97ffbe149e747f54d63e39a674fa248bb24902a14c079803067949a  cjson-v1.7.7.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index fabfe5df3b..e91ce9b4b2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.6
+CJSON_VERSION = v1.7.7
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.14.1
