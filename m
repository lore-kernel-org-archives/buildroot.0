From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 20:37:10 +0200
Subject: [Buildroot] [git commit] netperf: bump to version 2.6.0
Message-ID: <20130414184111.766899B62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eecdea2aeaccdc028cf88e1575eefccfa0cb8c85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netperf/netperf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
