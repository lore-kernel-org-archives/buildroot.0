From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 10:43:49 +0800
Subject: [Buildroot] [PATCH 1/2] stress: fix download url
Message-ID: <1381200229.18302.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/stress/stress.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index df9065a..6e82b50 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STRESS_VERSION = 1.0.4
-STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
+STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
 STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
-- 
1.8.1.2
