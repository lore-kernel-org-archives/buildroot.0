From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  6 Oct 2011 14:39:12 +0200
Subject: [Buildroot] [PATCH] picocom: remove useless arguments from
	GENTARGETS
Message-ID: <1317904752-21507-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/picocom/picocom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index fa02594..fce50d9 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -15,4 +15,4 @@ define PICOCOM_INSTALL_TARGET_CMDS
 	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
 endef
 
-$(eval $(call GENTARGETS,package,picocom))
+$(eval $(call GENTARGETS))
-- 
1.7.4.1
