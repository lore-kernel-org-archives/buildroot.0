From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:23:36 +0100
Subject: [Buildroot] [PATCHv2] iperf: add license information
Message-ID: <1421753016-27233-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/iperf/iperf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 2947e5241974..8496b95d83cc 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,6 +6,8 @@
 
 IPERF_VERSION = 2.0.5
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf
+IPERF_LICENSE = MIT-like
+IPERF_LICENSE_FILES = COPYING
 
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
-- 
2.0.0
