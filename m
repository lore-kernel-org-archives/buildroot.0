From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 21:23:40 -0300
Subject: [Buildroot] [PATCH 3/4] netperf: bump to version 2.6.0
In-Reply-To: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365899021-7675-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netperf/netperf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 4af5e85..06758b9 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETPERF_VERSION = 2.5.0
+NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
 
-- 
1.8.1.5
