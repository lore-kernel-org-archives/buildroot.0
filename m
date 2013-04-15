From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:44:37 +0200
Subject: [Buildroot] [git commit] netperf: add license information
Message-ID: <20130415215906.BC5769B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc9acefae9d0a02e2c18da2bf31856bd07c9d7d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netperf/netperf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 06758b9..653dc7a 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -7,6 +7,8 @@
 NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
+NETPERF_LICENSE = netperf license
+NETPERF_LICENSE_FILES = COPYING
 
 define NETPERF_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/netperf \
