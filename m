From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 20 Nov 2012 22:21:31 -0500
Subject: [Buildroot] [PATCH] cjson: fix copy/paste error in target
	installation
Message-ID: <1353468091-2152-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index dd64010..ccc6010 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -23,7 +23,7 @@ define CJSON_INSTALL_STAGING_CMDS
 endef
 
 define CJSON_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(STAGING_DIR)/usr/include/cJSON.h
+	$(INSTALL) -D $(@D)/cJSON/cJSON.h $(TARGET_DIR)/usr/include/cJSON.h
 	$(INSTALL) -D $(@D)/cJSON/libcJSON.so $(TARGET_DIR)/usr/lib/libcJSON.so
 endef
 
-- 
1.7.9.5
