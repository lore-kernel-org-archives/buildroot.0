From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:32:58 +0100
Subject: [Buildroot] [git commit] collectd: explicitly disable zone plugin
Message-ID: <20161223214639.D546581765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6686a8b2bceb67bf855879f5fba4b2d0f9aa90f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's intended for solaris so no usage case for buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 060fe0a..1fec414 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -20,7 +20,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
-	write_mongodb write_redis xmms zfs_arc
+	write_mongodb write_redis xmms zfs_arc zone
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
