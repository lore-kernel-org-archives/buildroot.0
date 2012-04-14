From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 14 Apr 2012 23:06:42 +0200
Subject: [Buildroot] [git commit] Bump sam-ba version to 2.11
Message-ID: <20120414215233.DCDCF96AC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11c06f763423dabcf1cfe1c8b41c384a4b884222
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sam-ba/sam-ba.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index d00575c..d5ab9f6 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,11 +1,11 @@
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
-SAM_BA_VERSION = 2.10
+SAM_BA_VERSION = 2.11
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
 
 define HOST_SAM_BA_EXTRACT_CMDS
         unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
-        mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
-        rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
+        mv $(BUILD_DIR)/sam-ba_cdc_cdc_linux/* $(@D)
+        rmdir $(BUILD_DIR)/sam-ba_cdc_cdc_linux/
 endef
 
 # Since it's a prebuilt application and it does not conform to the
