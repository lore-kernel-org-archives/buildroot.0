From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] gperf: add gperf-host package
	(required by webkit)
Message-ID: <20100128150633.49F2777719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96662841910829fd9255b719a701a129189810af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gperf/gperf.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 0dec44e..89f355b 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -14,3 +14,4 @@ GPERF_INSTALL_TARGET = YES
 GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,gperf))
+$(eval $(call AUTOTARGETS,package,gperf,host))
-- 
1.6.3.3
