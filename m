From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:01:13 +0100
Subject: [Buildroot] [git commit] dcron: indentation cleanup
Message-ID: <20160309220856.C36D87F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b51efee098b5257b44161dfd88d09c77e83539a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dcron/dcron.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 4a6fc47..7e81b63 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -25,8 +25,8 @@ define DCRON_INSTALL_TARGET_CMDS
 	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
 	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
 	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
-	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
-	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
+		$(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
+		$(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
 endef
 
 define DCRON_INSTALL_INIT_SYSV
