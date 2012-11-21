From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:05:55 +0100
Subject: [Buildroot] [git commit] cjson: fix copy/paste error in target
	installation
Message-ID: <20121121101539.1C3499540A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd0f43a2c56e1ac2cb30c0af15cb7029e668a219
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cjson/cjson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
