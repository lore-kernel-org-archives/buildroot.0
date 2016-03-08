From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Mar 2016 22:58:03 +0100
Subject: [Buildroot] [PATCH 1/4] font-awesome: indentation cleanup
Message-ID: <1457474286-18685-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/font-awesome/font-awesome.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 6ebb92c..e93d7c0 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -10,9 +10,9 @@ FONT_AWESOME_LICENSE = OFLv1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
-        mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-        $(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
-                cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
+	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
+	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
+		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
