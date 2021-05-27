From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 May 2021 15:50:40 +0300
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
Message-ID: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original site is gone.

Fixes:
http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/netperf/netperf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 8b2280830f3c..0c423249c4c9 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETPERF_VERSION = 2.7.0
-NETPERF_SITE = ftp://ftp.netperf.org/netperf
+NETPERF_SITE = http://sources.buildroot.net/netperf
 NETPERF_SOURCE = netperf-$(NETPERF_VERSION).tar.bz2
 # gcc 5+ defaults to gnu99 which breaks netperf
 NETPERF_CONF_ENV = \
-- 
2.30.2
