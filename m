From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:38:24 +0200
Subject: [Buildroot] [git commit] package/systemd-bootchart: indentation
	cleanup
Message-ID: <20161013054826.3B124817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fde62c31a363218f1432caff8bbb0d46dac1081b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
