From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2018 19:21:29 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.7.1
Message-ID: <20180112182129.16865-1-fontaine.fabrice@gmail.com>
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
index 44de790dd4..ea2ecbb7e9 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 6429f928c32c7f24714f85550b7fdff6fb424b60bc05fafa7bd8137af5182b55  cjson-v1.7.0.tar.gz
+sha256 28ef8c069db19010b9af247b86b05f0f879ac914a4620997c3e5181465170b40  cjson-v1.7.1.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 8220f40c80..88a33a2ce4 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.0
+CJSON_VERSION = v1.7.1
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.14.1
