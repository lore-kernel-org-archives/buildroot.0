From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  2 Aug 2012 22:53:47 -0400
Subject: [Buildroot] [PATCH 1/6] cjson: Add license info
Message-ID: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index a9b0bcf..44ddfc2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -7,6 +7,8 @@ CJSON_VERSION         = undefined
 CJSON_SOURCE          = cJSONFiles.zip
 CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
 CJSON_INSTALL_STAGING = YES
+CJSON_LICENSE         = MIT
+CJSON_LICENSE_FILES   = cJSON/README
 
 define CJSON_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)
-- 
1.7.9.5
