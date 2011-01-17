From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] gperf: bump to version 3.0.4
Message-ID: <20110117202414.3112189008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5118e1cf26641b6dd4dba0dd83be12b1ba56020d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gperf/gperf.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index f48ba9f..3593637 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -3,12 +3,9 @@
 # gperf
 #
 #############################################################
-GPERF_VERSION = 3.0.3
-GPERF_SOURCE = gperf-$(GPERF_VERSION).tar.gz
+
+GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
-GPERF_AUTORECONF = NO
-GPERF_INSTALL_STAGING = NO
-GPERF_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS,package,gperf))
 $(eval $(call AUTOTARGETS,package,gperf,host))
-- 
1.7.3.4
