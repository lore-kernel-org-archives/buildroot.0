From: Chih-Min Chao <cmchao@gmail.com>
Date: Mon, 13 Sep 2010 23:12:11 +0800
Subject: [Buildroot] [PATCH 1/5] iperf : bump to 2.0.5
In-Reply-To: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
References: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
Message-ID: <1284390735-2261-2-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/iperf/iperf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 3f8e3fc..843b53b 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -3,7 +3,7 @@
 # iperf
 #
 #############################################################
-IPERF_VERSION = 2.0.4
+IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
 
-- 
1.7.0.4
