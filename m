From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 23:46:50 +0100
Subject: [Buildroot] [git commit] collectd: drop memcachec from disable list
Message-ID: <20141108230843.02A1EB3814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abfc63873166db527d7fa601ec95b06b937ac0a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it is explicitly handled below. No functional change, but cleaner this way.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 2dc27f5..4647bd5 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -14,7 +14,7 @@ COLLECTD_LICENSE_FILES = COPYING
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
 		gmond hddtemp ipmi ipvs java libvirt lpar lvm madwifi mbmon \
-		memcachec modbus multimeter netapp netlink nginx \
+		modbus multimeter netapp netlink nginx \
 		notify_desktop notify_email numa nut onewire oracle perl pf \
 		pinba postgresql powerdns python redis routeros rrdcached \
 		sigrok tape target_v5upgrade teamspeak2 ted \
