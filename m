From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:32:35 +0100
Subject: [Buildroot] [git commit] collectd: drop notify_email global disable
Message-ID: <20161223214639.CA61381765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5829f36b8c5c4525cbfbdf296c719d0a7862d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's a no-op since it's disabled/enabled by the config knob.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 942ba38..060fe0a 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -16,7 +16,7 @@ COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi email \
 	gmond hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
-	mic multimeter netapp notify_desktop notify_email numa \
+	mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
