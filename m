From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 16:15:24 -0300
Subject: [Buildroot] [PATCH 2/2] gtkperf: add license information
In-Reply-To: <1403637324-13994-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403637324-13994-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403637324-13994-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtkperf/gtkperf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index fa9531d..0542a26 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -8,5 +8,7 @@ GTKPERF_VERSION = 0.40
 GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
 GTKPERF_DEPENDENCIES = libgtk2
+GTKPERF_LICENSE = GPLv2
+GTKPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
