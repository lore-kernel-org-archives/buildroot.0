From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:48:42 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/collectd: fix
 build with dpdk_telemetry
Message-ID: <20200828164643.6360B865B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c69c0eefecda52411a104c57ef5286558ca9b225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fix typo added by 44e0b6014f7e67901af346af8f6a9452b095ddd5

Fixes:
 - http://autobuild.buildroot.org/results/770293a007d683cb6f82f1fd3bcc20967e2b4bed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 668530f1e32375b98e9ca2188431485261f3ee7b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 52b218e139..a67293159b 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -157,7 +157,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
-	$(if $(BR2_PACKAGE_COLLECTD_DPKD_TELEMETRY),jansson) \
+	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
