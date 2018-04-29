From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:28:55 +0200
Subject: [Buildroot] [PATCH 1/1] libbson: bump to version 1.9.4
Message-ID: <20180429122855.20295-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbson/libbson.hash | 4 +++-
 package/libbson/libbson.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
index 27abe90bfd..b20a0cd8d4 100644
--- a/package/libbson/libbson.hash
+++ b/package/libbson/libbson.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	aad410123e4bd8a9804c3c3d79e03344e2df104872594dc2cf19605d492944ba libbson-1.6.2.tar.gz
+sha256	c3cc230a3451bf7fedc5bb34c3191fd23d841e65ec415301f6c77e531924b769 libbson-1.9.4.tar.gz
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
+sha256	8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e THIRD_PARTY_NOTICES
diff --git a/package/libbson/libbson.mk b/package/libbson/libbson.mk
index 8a71fc394c..2c9cbc7fe0 100644
--- a/package/libbson/libbson.mk
+++ b/package/libbson/libbson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSON_VERSION = 1.6.2
+LIBBSON_VERSION = 1.9.4
 LIBBSON_SITE = https://github.com/mongodb/libbson/releases/download/$(LIBBSON_VERSION)
 LIBBSON_LICENSE = Apache-2.0, MIT (jsonl), ISC (b64), Zlib (md5)
 LIBBSON_LICENSE_FILES = COPYING THIRD_PARTY_NOTICES
-- 
2.14.1
