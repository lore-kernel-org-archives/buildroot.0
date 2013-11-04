From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 22:36:12 +0100
Subject: [Buildroot] [git commit] netperf: enable demo mode
Message-ID: <20131104214740.BDBA1818B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4ea640455a67ff4e355c286462ae15e7eb13f74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable demo mode for netperf to activates a global "-D" <interval> option.
This option will display interim results at least every time interval.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netperf/netperf.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
