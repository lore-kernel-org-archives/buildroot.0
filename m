From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Fri, 27 Oct 2017 21:22:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/restorecond: indentation cleanup
Message-ID: <1509132125-14995-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/restorecond/restorecond.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 1968ba5..5c7b872 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -35,9 +35,9 @@ define RESTORECOND_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D $(@D)/restorecond.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/restorecond.service
 
-    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-    ln -fs ../../../../usr/lib/systemd/system/restorecond.service \
-        $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/restorecond.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/restorecond.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/restorecond.service
 
 	$(INSTALL) -m 0600 -D $(@D)/org.selinux.Restorecond.service \
 		$(TARGET_DIR)/etc/systemd/system/org.selinux.Restorecond.service
-- 
1.9.1
