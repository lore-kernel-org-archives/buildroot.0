From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:29:34 +0100
Subject: [Buildroot] [git commit] package/restorecond: indentation cleanup
Message-ID: <20171029193629.838E58016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=437d04b7027b0fb61b15396fbec50652651cfd5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/restorecond/restorecond.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 1968ba5..aaa59b3 100644
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
