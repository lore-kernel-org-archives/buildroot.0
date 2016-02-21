From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 21 Feb 2016 14:09:14 +0100
Subject: [Buildroot] [PATCH 1/2] collectd: Fix typo
Message-ID: <1456060155-27515-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 06c5389..eb66f25 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -16,7 +16,7 @@ COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi email \
 	gmond hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
-	mic multimeter netapp  notify_desktop notify_email numa \
+	mic multimeter netapp notify_desktop notify_email numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
-- 
2.7.0
