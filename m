From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:49:04 +0100
Subject: [Buildroot] [git commit] psplash: indentation cleanup
Message-ID: <20160310224913.308187FDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ffe8c8daf2d03d72d8b5b5de85f289818cd1c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psplash/psplash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 85c0fb8..4e365c5 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -14,13 +14,13 @@ define PSPLASH_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
-		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/
 
 	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
 	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
-		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 endef
 
 $(eval $(autotools-package))
