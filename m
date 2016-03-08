From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:59:31 +0100
Subject: [Buildroot] [git commit] font-awesome: indentation cleanup
Message-ID: <20160308225957.57C04802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b83ad32d5c0409af181181efd4c3ffb0b07c5cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/font-awesome/font-awesome.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 6ebb92c..3d2ccca 100644
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
