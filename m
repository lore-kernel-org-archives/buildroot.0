From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed,  1 Jul 2015 22:59:11 -0400
Subject: [Buildroot] [PATCH 1/2] rapidjson: bump to version 1.0.2
Message-ID: <1435805952-2512-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/rapidjson/rapidjson.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 6658da2..1ad9314 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = 39f5eeb764c6d1e1cbff1717410d9710bf943009
+RAPIDJSON_VERSION = v1.0.2
 RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
-- 
1.7.9.5
