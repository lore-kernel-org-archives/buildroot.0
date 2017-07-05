From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  5 Jul 2017 21:01:23 +0200
Subject: [Buildroot] [PATCH 1/1] cjson: bump to version 1.5.6
Message-ID: <1499281283-6179-1-git-send-email-fontaine.fabrice@gmail.com>
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
index 9e12791..a14223a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 f131a3067c78603683f84759de31320444f58d859a77afa77fca858d92ceba60  cjson-v1.5.5.tar.gz
+sha256 0ab704247ddb85b65f860923db78013c1376b632785cc3cde77aacddbeac7778  cjson-v1.5.6.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index dc1eb06..ef37b51 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.5
+CJSON_VERSION = v1.5.6
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.5.0
