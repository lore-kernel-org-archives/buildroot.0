From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 12 Oct 2016 23:05:21 +0200
Subject: [Buildroot] [PATCH 1/4] package/systemd-bootchart: indentation
	cleanup
Message-ID: <1476306324-6162-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/systemd-bootchart/systemd-bootchart.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 3d91b05..354270e 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -18,7 +18,7 @@ SYSTEMD_BOOTCHART_AUTORECONF = YES
 SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
 
 define SYSTEMD_BOOTCHART_INTLTOOLIZE
-        cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
+	cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
 endef
 SYSTEMD_BOOTCHART_PRE_CONFIGURE_HOOKS = SYSTEMD_BOOTCHART_INTLTOOLIZE
 
-- 
1.9.1
