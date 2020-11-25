From: Francois Gervais <fgervais@distech-controls.com>
Date: Wed, 25 Nov 2020 17:39:55 -0500
Subject: [Buildroot] [PATCH v2 1/2] Revert "package/systemd: disable
 portabled"
Message-ID: <20201125223956.24847-1-fgervais@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit b37fa74380557689f2309370c5bc1e770a1831eb.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 package/systemd/systemd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cb12f667d6..e24c357ccf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -33,7 +33,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dnss-systemd=true \
-	-Dportabled=false \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Drootlibdir='/usr/lib' \
-- 
2.17.1
