From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue,  7 May 2013 21:54:28 +0100
Subject: [Buildroot] [PATCH] gperf: add license information
Message-ID: <1367960068-14286-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gperf/gperf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 1254f0c..59c5a09 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -6,6 +6,8 @@
 
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
+GPERF_LICENSE = GPLv3+
+GPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.1.2
