From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Jun 2021 19:32:42 +0200
Subject: [Buildroot] [git commit] package/netperf: move SITE so s.b.o
Message-ID: <20210602170424.5998C84180@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cf8adc03999a39a9b80a4612b5f14baae73ce5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original site is gone.

Fixes:
http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netperf/netperf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 8b2280830f..85f6bce033 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETPERF_VERSION = 2.7.0
-NETPERF_SITE = ftp://ftp.netperf.org/netperf
+NETPERF_SITE = http://sources.buildroot.org/netperf
 NETPERF_SOURCE = netperf-$(NETPERF_VERSION).tar.bz2
 # gcc 5+ defaults to gnu99 which breaks netperf
 NETPERF_CONF_ENV = \
