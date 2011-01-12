From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jan 2011 15:56:22 -0300
Subject: [Buildroot] [PATCH] gperf: bump to version 3.0.4
Message-ID: <1294858582-25707-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
