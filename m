From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 22:11:12 -0300
Subject: [Buildroot] [PATCH 3/4] sysstat: bump to version 11.0.0
In-Reply-To: <1403053873-21190-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403053873-21190-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403053873-21190-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 23486b6..8365087 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 10.2.1
+SYSSTAT_VERSION = 11.0.0
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
-- 
1.8.5.5
