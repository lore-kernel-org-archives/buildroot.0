From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Mar 2018 23:37:50 +0200
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.7.5
Message-ID: <20180327213750.7720-1-fontaine.fabrice@gmail.com>
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
index 2e615ad447..b4a6d00cca 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 c3fc800cf9106db4ef5a5ef1fba7d144b21d73b68ad78234e182ebab12079277  cjson-v1.7.4.tar.gz
+sha256 a8252abef9c4e0e672fe247cb46318f00a0aa975e455c8d943ae91492249dc3a  cjson-v1.7.5.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 7c302abbf5..60bb73945a 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.4
+CJSON_VERSION = v1.7.5
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.14.1
