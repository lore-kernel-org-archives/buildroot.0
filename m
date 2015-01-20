From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:15:06 +0100
Subject: [Buildroot] [PATCH] iperf: add license information
Message-ID: <1421748906-417-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/iperf/iperf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 2947e5241974..4ec56e0f2c23 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,6 +6,7 @@
 
 IPERF_VERSION = 2.0.5
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf
+IPERF_LICENSE_FILES = COPYING
 
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
-- 
2.0.0
