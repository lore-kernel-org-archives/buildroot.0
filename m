From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:48:59 +0100
Subject: [Buildroot] [git commit] freerdp: indentation cleanup
Message-ID: <20160310224913.1C11E805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91ebe63dd42f82e76698cc8c2d6eead2037ddce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index baf83f0..e8e5be4 100644
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
 
