From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:44:18 +0200
Subject: [Buildroot] [git commit] package/collectd: fix build with
 dpdk_telemetry
Message-ID: <20200818213743.AA49A7FE3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=668530f1e32375b98e9ca2188431485261f3ee7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by 44e0b6014f7e67901af346af8f6a9452b095ddd5

Fixes:
 - http://autobuild.buildroot.org/results/770293a007d683cb6f82f1fd3bcc20967e2b4bed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 2eed6b2c16..21da8fddc8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -161,7 +161,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
-	$(if $(BR2_PACKAGE_COLLECTD_DPKD_TELEMETRY),jansson) \
+	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
