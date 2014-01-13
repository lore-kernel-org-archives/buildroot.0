From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 13 Jan 2014 21:17:20 +0800
Subject: [Buildroot] [PATCH] sysstat: bump to version 10.2.0
Message-ID: <1389619040.24423.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/sysstat/sysstat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 02e4c88..7883d66 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 10.0.3
+SYSSTAT_VERSION = 10.2.0
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
-- 
1.8.1.2
