From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 09:42:09 -0300
Subject: [Buildroot] [PATCH 1/2] netperf: add license information
Message-ID: <1366029730-15371-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netperf/netperf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 06758b9..1af971a 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -7,6 +7,8 @@
 NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
+NETPERF_LICENSE = netperf
+NETPERF_LICENSE_FILES = COPYING
 
 define NETPERF_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/netperf \
-- 
1.8.1.5
