From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Thu, 31 Oct 2013 10:56:45 +0800
Subject: [Buildroot]  [PATCH] netperf: enable demo mode.
Message-ID: <1383188205-2941-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable demo mode of netperf.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/netperf/netperf.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 2bd11f3..455f27e 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -7,6 +7,7 @@
 NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
+NETPERF_CONF_OPT = --enable-demo=yes
 NETPERF_LICENSE = netperf license
 NETPERF_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
