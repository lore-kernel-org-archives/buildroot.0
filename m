From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Mar 2016 22:48:53 +0100
Subject: [Buildroot] [PATCH 1/3] freerdp: indentation cleanup
Message-ID: <1457646535-976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/freerdp/freerdp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index baf83f0..326f2b7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -248,9 +248,9 @@ FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_CLEANUP
 # can start a server.
 define FREERDP_INSTALL_KEYS
 	$(INSTALL) -m 0644 -D $(@D)/server/Sample/server.key \
-		      $(TARGET_DIR)/etc/freerdp/keys/server.key
+		$(TARGET_DIR)/etc/freerdp/keys/server.key
 	$(INSTALL) -m 0644 -D $(@D)/server/Sample/server.crt \
-		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
+		$(TARGET_DIR)/etc/freerdp/keys/server.crt
 endef
 FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
 
-- 
1.9.1
