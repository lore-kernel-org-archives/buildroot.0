From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:24 -0300
Subject: [Buildroot] [PATCH 10/25] sysstat: bump to version 10.0.2
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 30eaa73..0a17b4d 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.1.7
+SYSSTAT_VERSION = 10.0.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
-SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
+SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-- 
1.7.3.4
