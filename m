From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Apr 2015 10:35:22 -0300
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.0.4
Message-ID: <1428672922-17101-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.hash | 2 +-
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 1a96e2f..226ff06 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	27d4ca66869dce132ace3194dd7d7539	sysstat-11.0.2.tar.xz
+md5	df1ed75656eb06320088d54247f0e803	sysstat-11.0.4.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 30fd9b2..6bdd3b8 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.2
+SYSSTAT_VERSION = 11.0.4
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.0.5
