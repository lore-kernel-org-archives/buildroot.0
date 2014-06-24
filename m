From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:08 -0300
Subject: [Buildroot] [PATCH 02/54] irda-utils: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtkperf/gtkperf.mk       | 2 ++
 package/irda-utils/irda-utils.mk | 2 ++
 2 files changed, 4 insertions(+)

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
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 4be80d7..e4958e5 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -6,6 +6,8 @@
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
+IRDA_UTILS_LICENSE = GPLv2+
+IRDA_UTILS_LICENSE_FILES = man/COPYING
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
 ifeq ($(BR2_USE_MMU),)
-- 
1.8.5.5
